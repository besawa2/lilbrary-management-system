DROP DATABASE IF EXISTS library_management_system;
CREATE DATABASE library_management_system;
USE library_management_system;

DROP TABLE IF EXISTS reservations;
DROP TABLE IF EXISTS rentals;
DROP TABLE IF EXISTS user_profile;
DROP TABLE IF EXISTS staff;
DROP TABLE IF EXISTS events;
DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS books;

CREATE TABLE books ( 
    BookID INT AUTO_INCREMENT PRIMARY KEY, 
    Title VARCHAR(255), 
    Author VARCHAR(255), 
    Genre VARCHAR(100), 
    ISBN INT, 
    PublishDate DATE, 
    Publisher VARCHAR(255),
    BookCover VARCHAR(255),
    BookStatus ENUM('available', 'rented', 'returned') DEFAULT 'available'
);


CREATE TABLE user (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    Name VARCHAR(255) NOT NULL
);

CREATE TABLE rentals ( 
    RentalID INT AUTO_INCREMENT PRIMARY KEY, 
    BookID INT, 
    CheckoutDate DATE, 
    DueDate DATE, 
    DateReturned DATE, 
    UserID INT, 
    FOREIGN KEY (BookID) REFERENCES books(BookID), 
    FOREIGN KEY (UserID) REFERENCES user(UserID) 
); 

CREATE TABLE user_profile ( 
    UserID INT AUTO_INCREMENT PRIMARY KEY, 
    Description VARCHAR(255),
    Address VARCHAR(255),
    PhoneNumber VARCHAR(15),
    PenaltyBalance DECIMAL(10,2) DEFAULT 0.00,
    FaveGenre VARCHAR(100), 
    FaveBook VARCHAR(255), 
    ProfilePicture VARCHAR(255), 
    FOREIGN KEY (UserID) REFERENCES user(UserID)
);


CREATE TABLE events ( 
    EventID INT AUTO_INCREMENT PRIMARY KEY, 
    StartDate DATE, 
    EndDate DATE, 
    Location VARCHAR(255), 
    Description VARCHAR(255) 
); 

CREATE TABLE staff ( 
    StaffID INT AUTO_INCREMENT PRIMARY KEY, 
    Name VARCHAR(255), 
    Address VARCHAR(255), 
    Position VARCHAR(100), 
    Salary DECIMAL(10,2) 
); 

CREATE TABLE reservations ( 
    ReserveID INT AUTO_INCREMENT PRIMARY KEY, 
    BookID INT, 
    UserID INT, 
    ReserveEndDate DATE, 
    FOREIGN KEY (BookID) REFERENCES books(BookID), 
    FOREIGN KEY (UserID) REFERENCES user(UserID)
); 

CREATE TABLE reviews(
    ReviewID INT AUTO_INCREMENT PRIMARY KEY,
    BookID INT,
    UserID INT,
    ReviewText TEXT,
    RATING INT,
    ReviewDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (BookID) REFERENCES books(BookID), 
    FOREIGN KEY (UserID) REFERENCES user(UserID)
);