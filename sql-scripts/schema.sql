-- Create database
CREATE DATABASE MovieDB;
USE MovieDB;

-- Create Movies table
CREATE TABLE Movies (
    MovieID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(100),
    Genre VARCHAR(50),
    ReleaseYear INT
);

-- Create Users table
CREATE TABLE Users (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Age INT,
    Location VARCHAR(100)
);

-- Create Ratings table
CREATE TABLE Ratings (
    RatingID INT PRIMARY KEY AUTO_INCREMENT,
    MovieID INT,
    UserID INT,
    Rating DECIMAL(2,1), -- Rating between 0.0 to 5.0
    RatingDate DATE,
    FOREIGN KEY (MovieID) REFERENCES Movies(MovieID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Create Reviews table
CREATE TABLE Reviews (
    ReviewID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    MovieID INT,
    ReviewText TEXT,
    ReviewDate DATE,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (MovieID) REFERENCES Movies(MovieID)
);