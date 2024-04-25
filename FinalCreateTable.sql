
DECLARE
   l_count NUMBER;
BEGIN
   SELECT COUNT(*) INTO l_count FROM user_tables WHERE table_name = 'MOVIEACTOR';
   IF l_count > 0 THEN
      EXECUTE IMMEDIATE 'DROP TABLE MOVIEACTOR';
   END IF;
   SELECT COUNT(*) INTO l_count FROM user_tables WHERE table_name = 'USERWATCHHISTORY';
   IF l_count > 0 THEN
      EXECUTE IMMEDIATE 'DROP TABLE USERWATCHHISTORY';
   END IF;
   SELECT COUNT(*) INTO l_count FROM user_tables WHERE table_name = 'USERADDRESS';
   IF l_count > 0 THEN
      EXECUTE IMMEDIATE 'DROP TABLE USERADDRESS';
   END IF;
   SELECT COUNT(*) INTO l_count FROM user_tables WHERE table_name = 'MOVIEACTOR';
   IF l_count > 0 THEN
      EXECUTE IMMEDIATE 'DROP TABLE MOVIEACTOR';
   END IF;
   SELECT COUNT(*) INTO l_count FROM user_tables WHERE table_name = 'MOVIES';
   IF l_count > 0 THEN
      EXECUTE IMMEDIATE 'DROP TABLE MOVIES';
   END IF;
   SELECT COUNT(*) INTO l_count FROM user_tables WHERE table_name = 'ACTORS';
   IF l_count > 0 THEN
      EXECUTE IMMEDIATE 'DROP TABLE ACTORS';
   END IF;
   SELECT COUNT(*) INTO l_count FROM user_tables WHERE table_name = 'USERS';
   IF l_count > 0 THEN
      EXECUTE IMMEDIATE 'DROP TABLE USERS';
   END IF;
   SELECT COUNT(*) INTO l_count FROM user_tables WHERE table_name = 'UserSubscription';
   IF l_count > 0 THEN
      EXECUTE IMMEDIATE 'DROP TABLE UserSubscription';
   END IF;
END;

/

CREATE TABLE Movies   (
    MovieID   int PRIMARY KEY,
    MovieName   varchar(255),
    Director   varchar(255),
    "Description"   varchar(255),
    AverageRating   int,
    Runtime   int,
    ReleaseDate   date,
    Genre   varchar(255),
    MovieFile varchar(200),
    ImageFile varchar(200)
);

/

CREATE TABLE UserWatchHistory   (
    MovieID   int,
    UserID   int,
    UserRating   int,
    PercentageWatched   decimal,
    WatchDate   date,
  PRIMARY KEY (  MovieID  ,   UserID  )
);

/

CREATE TABLE MovieActor   (
    ActorID   int,
    MovieID   int,
    "Role"   varchar(255),
  PRIMARY KEY (  ActorID  ,   MovieID  )
);

/

CREATE TABLE Actors   (
    ActorID   int PRIMARY KEY,
    Bio   varchar(255),
    Fname   varchar(255),
    Lname   varchar(255),
    Height   int,
    DOB   date
);

/

CREATE TABLE Users   (
    UserID   int PRIMARY KEY,
    Fname   varchar(255),
    Lname   varchar(255),
    Email   varchar(255),
    DOB   date,
    HomeIP   int,
    SubscriptionID int
);

/

CREATE TABLE UserAddress   (
    AddressID   int PRIMARY KEY,
    UserID int,
    AddressLine1   varchar(255),
    AddressLine2   varchar(255),
    City   varchar(255),
    "State"   varchar(255),
    ZipCode   int
);

/

CREATE TABLE UserSubscriptions   (
    SubscriptionID  int not null PRIMARY KEY,
    SubscriptionType   varchar(255),
    RenewalDate   date,
    Balance   int
);

CREATE TABLE UserSignIn (
   UserID int not null PRIMARY KEY,
   username varchar(50),
   passwordHash varchar(50)
);

/

ALTER TABLE   Users   ADD FOREIGN KEY (  SubscriptionID  ) REFERENCES   UserSubscriptions   (  SubscriptionID  );

/

ALTER TABLE   UserWatchHistory   ADD FOREIGN KEY (  MovieID  ) REFERENCES   Movies   (  MovieID  );

/

ALTER TABLE   UserWatchHistory   ADD FOREIGN KEY (  UserID  ) REFERENCES  Users   (  UserID  );

/

ALTER TABLE   MovieActor   ADD FOREIGN KEY (  MovieID  ) REFERENCES   Movies   (  MovieID  );

/

ALTER TABLE   MovieActor   ADD FOREIGN KEY (  ActorID  ) REFERENCES   Actors  (  ActorID  );

/

ALTER TABLE   UserAddress ADD FOREIGN KEY (  UserID  ) REFERENCES   Users   (  UserID  );


ALTER TABLE UserSignIn ADD FOREIGN KEY ( UserID ) REFERENCES Users (UserID);
    