CREATE TABLE city(
   name VARCHAR(255) NOT NULL,
   PRIMARY KEY(name)
);

CREATE TABLE location(
   id INT NOT NULL,
   city VARCHAR(255) NOT NULL,
   street VARCHAR(255) NOT NULL,
   PRIMARY KEY(id),
   CONSTRAINT fk_location
      FOREIGN KEY(city) 
	  REFERENCES city(name)
);

CREATE TABLE date(
   id INT GENERATED ALWAYS AS IDENTITY,
   date DATE NOT NULL,
   PRIMARY KEY(id)
);

CREATE TABLE time(
   id INT GENERATED ALWAYS AS IDENTITY,
   minute INT NOT NULL,
   hour INT NOT NULL,
   PRIMARY KEY(id)
);

CREATE TABLE workload(
   id INT GENERATED ALWAYS AS IDENTITY,
   percentage INT NOT NULL,
   location_id INT,
   date_id INT,
   time_id INT,
   PRIMARY KEY(id),
   CONSTRAINT fk_workload
      FOREIGN KEY(location_id) REFERENCES location(id),
      FOREIGN KEY(date_id) REFERENCES date(id),
      FOREIGN KEY(time_id) REFERENCES time(id)
);

INSERT INTO city(name) 
VALUES
    ("Osnabrück"),
    ("Lübeck"),
    ("Hamburg"),
    ("Iserlohn"),
    ("Hannover"),
    ("Saarbrücken"),
    ("Wuppertal"),
    ("Wetzlar"),
    ("Düsseldorf"),
    ("Dresden"),
    ("Kiel"),
    ("Neuss"),
    ("Worms"),
    ("Mönchengladbach"),
    ("Gelsenkirchen"),
    ("Unna"),
    ("Gütersloh"),
    ("Rostock"),
    ("Koblenz"),
    ("Bremen"),
    ("Münster"),
    ("Duisburg"),
    ("Magdeburg"),
    ("Essen"),
    ("Krefeld"),
    ("Düren"),
    ("Aachen"),
    ("Hamm"),
    ("Mülheim an der Ruhr"),
    ("Jena"),
    ("Minden"),
    ("Dortmund"),
    ("Ludwigshafen am Rhein"),
    ("Fürth"),
    ("Bottrop"),
    ("Augsburg"),
    ("Arnsberg"),
    ("Regensburg"),
    ("Troisdorf"),
    ("Leipzig"),
    ("Hagen"),
    ("Dorsten"),
    ("Grevenbroich"),
    ("Gießen"),
    ("Siegen"),
    ("Viersen"),
    ("Hilden"),
    ("Berlin"),
    ("Ratingen"),
    ("Bochum"),
    ("Bonn"),
    ("Ulm"),
    ("Erfurt"),
    ("Oberhausen"),
    ("Bielefeld"),
    ("Mainz"),
    ("Chemnitz"),
    ("Nürnberg"),
    ("Gladbeck"),
    ("Witten"),
    ("München"),
    ("Remscheid"),
    ("Bremerhave")
    
INSERT INTO location(city, street, id) 
VALUES
    ("Essen","Stoppenberger Straße 61",11)
    ("Münster","Hammer Straße 385",12)
    ("Dortmund","Bornstraße 160",13)
    ("Hamm","Hafenstraße 30",14)
    ("Düsseldorf","Münsterstraße 169",15)
    ("Düsseldorf","Erkrather Straße 230",16)
    ("Bochum","Friedrich-Lueg-Straße 2-8",17)
    ("Osnabrück","Grosshandelsring 8",18)
    ("Essen","Ruhrallee 165",19)
    ("Oberhausen","Mülheimer Straße 14-18",20)
    ("Mönchengladbach","Waldnieler Straße 50",21)
    ("Hannover","Lilienthalstraße 1",22)
    ("Wuppertal","Clausewitzstraße 82",23)
    ("Berlin","Kurfürstendamm 156",24)
    ("Dortmund","Hermannstraße 108",25)
    ("Bielefeld","Detmolder Straße 279",26)
    ("Gelsenkirchen","Asbeckstraße 3",27)
    ("Siegen","Hagener Straße 67",28)
    ("Berlin","Oraniendamm 6-10",29)
    ("Krefeld","Hafelsstraße 249",30)
    ("Kiel","Schwedendamm 9",31)
    ("Bochum","Herner Straße 412-414",32)
    ("Düsseldorf","Emanuel-Leutze-Straße 1",33)
    ("Bochum","Wittener Straße 2",34)
    ("München","Ingolstädter Straße 172-180",35)
    ("Wuppertal","Hatzfelder Straße 14",36)
    ("Berlin","Alexanderstraße 7",37)
    ("Aachen","Europaplatz 17",38)
    ("Düren","Im Großen Tal 2",39)
    ("Dortmund","Brandschachtstraße 4",40)
    ("Leipzig","Wollkämmereistraße 4",41)
    ("Iserlohn","Seilerseestraße 101",42)
    ("Lübeck","Bei der Lohmühle 84",43)
    ("Ludwigshafen am Rhein","Dessauer Straße 59",44)
    ("Hamburg","Schwarzer Weg 28",45)
    ("Hamburg","Röntgenstraße 28",46)
    ("Düsseldorf","Reisholzer Werftstraße 17-43",47)
    ("Berlin","Wilhelm-Kabus-Straße 77",48)
    ("Magdeburg","Brenneckestraße 46",49)
    ("Ratingen","Boschstraße 5",50)
    ("Bremen","Eduard-Grunow-Straße 24",51)
    ("Worms","Schönauer Straße 2",52)
    ("München","Landaubogen 1",53)
    ("Bremen","Schragestraße 4",54)
    ("Nürnberg","Regensburger Straße 330",55)
    ("Berlin","Ullsteinstraße 128",56)
    ("Berlin","Hauptstraße 141",57)
    ("Rostock","Erich-Schlesinger-Straße 28",58)
    ("Duisburg","Hochstraße 11",60)
    ("Berlin","Hellersdorfer Straße 235",61)
    ("Hagen","Elberfelder Straße 93",62)
    ("Münster","Rektoratsweg 50",64)
    ("München","Putzbrunner Straße 73",65)
    ("Bochum","Harpener Hellweg 7",66)
    ("Mönchengladbach","Odenkirchener Straße 129",67)
    ("Chemnitz","Reichsstraße 58",69)
    ("Essen","Limbecker Platz 1",70)
    ("Gütersloh","Langer Weg 11",71)
    ("Bremen","Löwenhof 9",74)
    ("Bremerhaven","Voßstraße 5a",75)
    ("Fürth","Siemensstraße 3",76)
    ("Mülheim an der Ruhr","Schloßstraße 48",77)
    ("Bottrop","Friedrich-Ebert-Straße 106",78)
    ("Hamburg","Schnackenburgallee 43-45",80)
    ("Jena","Keßlerstraße 12",81)
    ("Berlin","Tamara-Danz-Straße 11",82)
    ("Duisburg","Duisburger Straße 226",84)
    ("Witten","Bahnhofstraße 69",86)
    ("Saarbrücken","Mainzer Straße 120",87)
    ("Gladbeck","Hochstraße 10",88)
    ("Berlin","Oderbruchstraße 14",89)
    ("Gießen","Neustadt 28",90)
    ("Berlin","Stromstraße 11-17",91)
    ("Bonn","Am Schickshof 6",94)
    ("Troisdorf","Poststraße 64",96)
    ("Minden","Stiftsallee 3",97)
    ("Augsburg","Meraner Straße 7",98)
    ("Mainz","Alte Mainzer Straße 125",99)
    ("Berlin","Weißenhöher Straße 88-108",100)
    ("Dresden","Freiberger Straße 35",101)
    ("Bielefeld","Herforder Straße 271",102)
    ("Leipzig","Lützner Straße 179",103)
    ("Remscheid","Neuenkamper Straße 3-9",104)
    ("Gelsenkirchen","Ückendorfer Straße 1",105)
    ("Arnsberg","Bahnhofstraße 84",106)
    ("Wetzlar","Bahnhofstraße 19-23",107)
    ("München","Lenbachplatz 4",108)
    ("Neuss","Rheinstraße 7",110)
    ("Gelsenkirchen","Adenauerallee 137-139",111)
    ("Krefeld","Hülser Straße 386",112)
    ("Wuppertal","Kaiserstraße 39",114)
    ("Erfurt","Hermsdorfer Straße 4",116)
    ("Unna","Kantstraße 1",117)
    ("Grevenbroich","Ostwall 31",118)
    ("Viersen","Kanalstraße 51-55",121)
    ("Dorsten","Borkener Straße 45",122)
    ("Hilden","Forststraße 1",123)
    ("Koblenz","Friedrich-Mohr-Straße 4-6",124)
    ("Nürnberg","Rollnerstraße 111",127)
    ("Duisburg","Ruhrorter Straße 100",129)
    ("Regensburg","Donaustaufer Straße 128",131)
    ("Berlin","Am Juliusturm 44",132)
    ("Ulm","Blaubeurer Straße 14-26",133)
    ("Hamburg","Große Bergstraße 156",134)