use chrono::Timelike;
use core::time;
use std::{str::FromStr, thread};

use futures::future::join_all;
use tokio_postgres::{Client, NoTls};

#[tokio::main]
async fn main() {
    let db_password = "VsPmbLmisfs42";
    let (client, connection) = tokio_postgres::connect(
        &format!("postgresql://postgress:{db_password}@db:5432/fitx"),
        NoTls,
    )
    .await
    .unwrap();

    tokio::spawn(async move {
        if let Err(e) = connection.await {
            eprintln!("connection error: {}", e);
        }
    });

    let (mut today, mut date_id) = correct_date(&client).await;

    let locations = client
        .query("SELECT id FROM location GROUP BY id", &[])
        .await
        .unwrap();

    let ids: Vec<i32> = locations.iter().map(|row| row.get(0)).collect();
    loop {
        let before = chrono::offset::Local::now().time();
        println!("Wait: {} secs.", 60 - before.second());
        thread::sleep(time::Duration::from_secs((60 - before.second()) as u64));
        println!("Begin!");
        let after = chrono::offset::Local::now().time();
        let time_id = (after.hour() * 60 + after.minute() + 1) as i32;
        if today != chrono::offset::Local::now().date_naive() {
            (today, date_id) = correct_date(&client).await;
        }

        retrieve_and_insert(&ids, &time_id, &date_id, &client).await;
    }
}

async fn retrieve_and_insert(ids: &Vec<i32>, time_id: &i32, date_id: &i32, client: &Client) {
    let percentages = collect_percentages(&ids).await;

    let mut query =
        String::from_str("INSERT INTO workload(percentage, location_id, date_id, time_id) VALUES ")
            .unwrap();

    for (percentage, location_id) in percentages {
        query.push_str(&format!(
            "({},{},{},{}),",
            percentage, location_id, date_id, time_id
        ));
    }
    query.remove(query.len() - 1);
    client.execute(&query, &[]).await.unwrap();
}

async fn collect_percentages(ids: &Vec<i32>) -> Vec<(i32, i32)> {
    let mut futures = Vec::new();

    for id in ids {
        futures.push(request_percentage(*id));
    }
    join_all(futures).await
}

async fn correct_date(client: &Client) -> (chrono::NaiveDate, i32) {
    let today = chrono::offset::Local::now().date_naive();
    let db_today = client
        .query("SELECT date FROM date WHERE date = $1::DATE", &[&today])
        .await
        .unwrap();

    if db_today.is_empty() {
        client
            .execute("INSERT INTO date (date) VALUES ($1)", &[&today])
            .await
            .unwrap();
    }

    let date_id = client.query("SELECT MAX(id) FROM date", &[]).await.unwrap();
    return (today, date_id[0].get(0));
}

async fn request_percentage(city_code: i32) -> (i32, i32) {
    let res = reqwest::get(format!(
        "https://www.fitx.de/fitnessstudio/{}/workload",
        city_code
    ))
    .await
    .unwrap()
    .text()
    .await
    .unwrap();
    return (
        parse_for(&res, "percentage").parse::<i32>().unwrap(),
        city_code,
    );
}

fn parse_for(text: &String, key: &str) -> String {
    let split: Vec<&str> = text.split(key).collect();
    if split.get(0).unwrap().len() > 1 {
        let first: Vec<&str> = split.get(1).unwrap().split(",").collect();
        let second: Vec<&str> = first.get(0).unwrap().split(":").collect();
        let value = second.get(1).unwrap();
        return value.to_string();
    }
    return "".to_string();
}

fn prettify(text: String) -> String {
    let s = text.replace("u00df", "ß");
    let s = s.replace("u00fc", "ü");
    let s = s.replace("u00dc", "Ü");
    let s = s.replace("u00f6", "ö");
    let s = s.replace("u00e4", "ä");
    let s = s.replace("\\", "");
    let s = s.replace("\"", "");
    return s;
}
