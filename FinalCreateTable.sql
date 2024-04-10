CREATE TABLE Movies   (
    MovieID   int PRIMARY KEY,
    MovieName   varchar(255),
    Director   varchar(255),
    "Description"   varchar(255),
    AverageRating   int,
    Runtime   int,
    ReleaseDate   date,
    Genre   varchar(255)
);

CREATE TABLE UserWatchHistory   (
    MovieID   int,
    UserID   int,
    UserRating   int,
    PercentageWatched   decimal,
    WatchDate   date,
  PRIMARY KEY (  MovieID  ,   UserID  )
);

CREATE TABLE MovieActor   (
    ActorID   int,
    MovieID   int,
    "Role"   varchar(255),
  PRIMARY KEY (  ActorID  ,   MovieID  )
);

CREATE TABLE Actors   (
    ActorID   int PRIMARY KEY,
    Bio   varchar(255),
    Fname   varchar(255),
    Lname   varchar(255),
    Height   int,
    DOB   date
);

CREATE TABLE Users   (
    UserID   int PRIMARY KEY,
    Fname   varchar(255),
    Lname   varchar(255),
    Email   varchar(255),
    DOB   date,
    HomeIP   int,
    SubscriptionID   int,
    AddressID   int 
);

CREATE TABLE UserAddress   (
    AddressID   int PRIMARY KEY,
    AddressLine1   varchar(255),
    AddressLine2   varchar(255),
    City   varchar(255),
    "State"   varchar(255),
    ZipCode   int
);

CREATE TABLE Subscription   (
    SubscriptionID   int PRIMARY KEY,
    SubscriptionType   varchar(255),
    RenewalDate   date,
    Balance   int
);

ALTER TABLE   LAB8Users   ADD FOREIGN KEY (  SubscriptionID  ) REFERENCES   LAB8Subscription   (  SubscriptionID  );

ALTER TABLE   LAB8UserWatchHistory   ADD FOREIGN KEY (  MovieID  ) REFERENCES   LAB8Movies   (  MovieID  );

ALTER TABLE   LAB8UserWatchHistory   ADD FOREIGN KEY (  UserID  ) REFERENCES   LAB8Users   (  UserID  );

ALTER TABLE   LAB8MovieActor   ADD FOREIGN KEY (  MovieID  ) REFERENCES   LAB8Movies   (  MovieID  );

ALTER TABLE   LAB8MovieActor   ADD FOREIGN KEY (  ActorID  ) REFERENCES   LAB8Actors  (  ActorID  );

ALTER TABLE   LAB8Users ADD FOREIGN KEY (  AddressID  ) REFERENCES   LAB8UserAddress   (  AddressID  );


