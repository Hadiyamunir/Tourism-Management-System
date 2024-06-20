-- Creating database and using it
create database TourismManagement;
use TourismManagement;
-- Tourists Table
CREATE TABLE Tourists (
    TouristID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100) UNIQUE,
    PhoneNumber VARCHAR(15),
    PassportNumber VARCHAR(20) UNIQUE,
    DateOfBirth DATE,
    Nationality VARCHAR(50)
);
-- Tours Table
CREATE TABLE Tours (
    TourID INT AUTO_INCREMENT PRIMARY KEY,
    TourName VARCHAR(100),
    Description TEXT,
    DurationDays INT,
    Price DECIMAL(10, 2),
    StartDate DATE,
    EndDate DATE
);
-- Bookings Table
CREATE TABLE Bookings (
    BookingID INT AUTO_INCREMENT PRIMARY KEY,
    TouristID INT,
    TourID INT,
    BookingDate DATE,
    NumberOfPeople INT,
    TotalPrice DECIMAL(10, 2),
    FOREIGN KEY (TouristID) REFERENCES Tourists(TouristID),
    FOREIGN KEY (TourID) REFERENCES Tours(TourID)
);
-- Payments Table
CREATE TABLE Payments (
    PaymentID INT AUTO_INCREMENT PRIMARY KEY,
    BookingID INT,
    PaymentDate DATE,
    Amount DECIMAL(10, 2),
    PaymentMethod VARCHAR(50),
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID)
);
-- Accommodations Table
CREATE TABLE Accommodations (
    AccommodationID INT AUTO_INCREMENT PRIMARY KEY,
    TourID INT,
    HotelName VARCHAR(100),
    CheckInDate DATE,
    CheckOutDate DATE,
    FOREIGN KEY (TourID) REFERENCES Tours(TourID)
);
-- Transport Table
CREATE TABLE Transport (
    TransportID INT AUTO_INCREMENT PRIMARY KEY,
    TourID INT,
    TransportType VARCHAR(50),
    DepartureDate DATE,
    ArrivalDate DATE,
    FOREIGN KEY (TourID) REFERENCES Tours(TourID)
);
-- Guides Table
CREATE TABLE Guides (
    GuideID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    PhoneNumber VARCHAR(15),
    Email VARCHAR(100) UNIQUE
);
-- TourGuides Table (Many-to-Many Relationship between Tours and Guides)
CREATE TABLE TourGuides (
    TourID INT,
    GuideID INT,
    PRIMARY KEY (TourID, GuideID),
    FOREIGN KEY (TourID) REFERENCES Tours(TourID),
    FOREIGN KEY (GuideID) REFERENCES Guides(GuideID)
);
-- Reviews Table
CREATE TABLE Reviews (
    ReviewID INT AUTO_INCREMENT PRIMARY KEY,
    TourID INT,
    TouristID INT,
    Rating INT CHECK(Rating BETWEEN 1 AND 5),
    Comment TEXT,
    ReviewDate DATE,
    FOREIGN KEY (TourID) REFERENCES Tours(TourID),
    FOREIGN KEY (TouristID) REFERENCES Tourists(TouristID)
);
-- Destinations Table
CREATE TABLE Destinations (
    DestinationID INT AUTO_INCREMENT PRIMARY KEY,
    TourID INT,
    DestinationName VARCHAR(100),
    VisitDate DATE,
    Description TEXT,
    FOREIGN KEY (TourID) REFERENCES Tours(TourID)
);
-- Inserting data into Tourists Table
INSERT INTO Tourists (FirstName, LastName, Email, PhoneNumber, PassportNumber, DateOfBirth, Nationality) VALUES
('Faroog', 'Hassan', 'farooq.hassan@example.com', '1234567890', 'A1234567', '1985-01-15', 'USA'),
('Munir', 'Ahmed', 'munir.ahmed@example.com', '0987654321', 'B7654321', '1990-06-25', 'Canada'),
('Muzna', 'Ali', 'muzna.ali@example.com', '5432167890', 'C9876543', '1995-03-10', 'UK');

-- Inserting data into Tours Table
INSERT INTO Tours (TourName, Description, DurationDays, Price, StartDate, EndDate) VALUES
('Grand Europe Tour', 'Explore the beauty of Europe.', 15, 2500.00, '2024-06-01', '2024-06-15'),
('Asian Adventure', 'Discover the wonders of Asia.', 10, 1800.00, '2024-07-10', '2024-07-20'),
('African Safari', 'Experience the wilds of Africa.', 12, 3000.00, '2024-08-05', '2024-08-17');

-- Inserting data into Bookings Table
INSERT INTO Bookings (TouristID, TourID, BookingDate, NumberOfPeople, TotalPrice) VALUES
(1, 1, '2024-04-01', 2, 5000.00),
(2, 2, '2024-05-01', 1, 1800.00),
(3, 3, '2024-06-01', 4, 12000.00);

-- Inserting data into Payments Table
INSERT INTO Payments (BookingID, PaymentDate, Amount, PaymentMethod) VALUES
(1, '2024-04-02', 5000.00, 'Credit Card'),
(2, '2024-05-02', 1800.00, 'PayPal'),
(3, '2024-06-02', 12000.00, 'Bank Transfer');

-- Inserting data into Accommodations Table
INSERT INTO Accommodations (TourID, HotelName, CheckInDate, CheckOutDate) VALUES
(1, 'Hotel Europe', '2024-06-01', '2024-06-15'),
(2, 'Hotel Asia', '2024-07-10', '2024-07-20'),
(3, 'Safari Lodge', '2024-08-05', '2024-08-17');

-- Inserting data into Transport Table
INSERT INTO Transport (TourID, TransportType, DepartureDate, ArrivalDate) VALUES
(1, 'Flight', '2024-06-01', '2024-06-01'),
(2, 'Flight', '2024-07-10', '2024-07-10'),
(3, 'Flight', '2024-08-05', '2024-08-05');

-- Inserting data into Guides Table
INSERT INTO Guides (FirstName, LastName, PhoneNumber, Email) VALUES
('Ali', 'Zahid', '5551234567', 'ali.zahid@example.com'),
('Badar', 'Hussain', '5559876543', 'badar.hussain@example.com'),
('Hina', 'Basit', '5554567890', 'hina.basit@example.com');

-- Inserting data into TourGuides Table
INSERT INTO TourGuides (TourID, GuideID) VALUES
(1, 1),
(2, 2),
(3, 3);

-- Inserting data into Reviews Table
INSERT INTO Reviews (TourID, TouristID, Rating, Comment, ReviewDate) VALUES
(1, 1, 5, 'Amazing tour, highly recommended!', '2024-06-20'),
(2, 2, 4, 'Great experience, but could improve the accommodation.', '2024-07-25'),
(3, 3, 5, 'Incredible adventure, unforgettable!', '2024-08-20');

-- Inserting data into Destinations Table
INSERT INTO Destinations (TourID, DestinationName, VisitDate, Description) VALUES
(1, 'Paris', '2024-06-02', 'Visit the Eiffel Tower and other landmarks.'),
(2, 'Tokyo', '2024-07-11', 'Experience the vibrant culture and technology.'),
(3, 'Serengeti', '2024-08-06', 'Explore the vast savannah and wildlife.');

-- Query 1: Selects the first name, last name, and email of tourists who have booked TourID 1.
SELECT T.FirstName, T.LastName, T.Email
FROM Tourists T
JOIN Bookings B ON T.TouristID = B.TouristID
WHERE B.TourID = 1;

-- Query 2: Calculates the total revenue generated from TourID 1.
SELECT SUM(B.TotalPrice) AS TotalRevenue
FROM Bookings B
WHERE B.TourID = 1;

-- Query 3: Retrieves the name and average rating of each tour.
SELECT TourName, AVG(Rating) AS AverageRating
FROM Tours T
JOIN Reviews R ON T.TourID = R.TourID
GROUP BY T.TourID, T.TourName;

-- Query 4: Selects the first name, last name, and email of guides assigned to TourID 1.
SELECT G.FirstName, G.LastName, G.Email
FROM Guides G
JOIN TourGuides TG ON G.GuideID = TG.GuideID
WHERE TG.TourID = 1;

-- Query 5: Retrieves details of the booking with BookingID 1, including tourist information.
SELECT B.BookingID, B.BookingDate, B.NumberOfPeople, B.TotalPrice, T.FirstName, T.LastName
FROM Bookings B
JOIN Tourists T ON B.TouristID = T.TouristID
WHERE B.BookingID = 1;

-- Query 6: Selects the distinct tour names that have a perfect rating of 5.
SELECT DISTINCT T.TourName
FROM Tours T
JOIN Reviews R ON T.TourID = R.TourID
WHERE R.Rating = 5;

-- Query 7: Retrieves details of destinations associated with TourID 1.
SELECT D.DestinationName, D.VisitDate, D.Description
FROM Destinations D
WHERE D.TourID = 1;

-- Query 8: Counts the number of bookings each tourist has made.
SELECT T.TouristID, T.FirstName, T.LastName, COUNT(B.BookingID) AS NumberOfBookings
FROM Tourists T
JOIN Bookings B ON T.TouristID = B.TouristID
GROUP BY T.TouristID, T.FirstName, T.LastName;

-- Query 9: Sums the total amount paid by each tourist.
SELECT T.TouristID, T.FirstName, T.LastName, SUM(P.Amount) AS TotalAmountPaid
FROM Tourists T
JOIN Bookings B ON T.TouristID = B.TouristID
JOIN Payments P ON B.BookingID = P.BookingID
GROUP BY T.TouristID, T.FirstName, T.LastName;

-- Query 10: Retrieves the names of tours and their assigned guides.
SELECT T.TourName, G.FirstName, G.LastName
FROM Tours T
JOIN TourGuides TG ON T.TourID = TG.TourID
JOIN Guides G ON TG.GuideID = G.GuideID;

-- Query 11: Selects the tour with the highest average rating.
SELECT T.TourName, AVG(R.Rating) AS AverageRating
FROM Tours T
JOIN Reviews R ON T.TourID = R.TourID
GROUP BY T.TourID, T.TourName
ORDER BY AverageRating DESC
LIMIT 1;

-- Query 12: Calculates the total revenue from all bookings.
SELECT SUM(TotalPrice) AS TotalRevenue
FROM Bookings;

-- Query 13: Counts the number of tourists for each tour.
SELECT T.TourName, COUNT(B.BookingID) AS NumberOfTourists
FROM Tours T
JOIN Bookings B ON T.TourID = B.TourID
GROUP BY T.TourID, T.TourName;

-- Query 14: Counts the number of bookings each tourist has made, filtering to those with more than one booking.
SELECT T.FirstName, T.LastName, COUNT(B.BookingID) AS NumberOfBookings
FROM Tourists T
JOIN Bookings B ON T.TouristID = B.TouristID
GROUP BY T.TouristID, T.FirstName, T.LastName
HAVING COUNT(B.BookingID) > 1;

-- Query 15: Selects reviews for TourID 1 along with the first name and last name of the tourists who wrote them.
SELECT T.FirstName, T.LastName, R.Rating, R.Comment
FROM Reviews R
JOIN Tourists T ON R.TouristID = T.TouristID
WHERE R.TourID = 1;

-- Query 16: Calculates the average amount paid in all payments.
SELECT AVG(P.Amount) AS AverageAmountPaid
FROM Payments P;

-- Query 17: Retrieves the names and start dates of tours starting in June.
SELECT TourName, StartDate
FROM Tours
WHERE MONTH(StartDate) = 6;

-- Query 18: Selects the first name, last name, and nationality of tourists who are from the USA.
SELECT FirstName, LastName, Nationality
FROM Tourists
WHERE Nationality = 'USA';

-- Query 19: Updates the phone number of the tourist with TouristID 1.
UPDATE Tourists
SET PhoneNumber = '1234567899'
WHERE TouristID = 1;

-- Query 20: Updates the price of the tour with TourID 1.
UPDATE Tours
SET Price = 1800.00
WHERE TourID = 1;

-- Query 21: Updates the description of the destination with DestinationID 1.
UPDATE Destinations
SET Description = 'A breathtaking park with a wide variety of wildlife.'
WHERE DestinationID = 1;

-- Query 22: Updates the comment of the review with ReviewID 1.
UPDATE Reviews
SET Comment = 'Amazing experience! Highly recommend.'
WHERE ReviewID = 1;

-- Query 23: Selects all tours that have a duration greater than 5 days and a price less than $2000.
SELECT * FROM Tours
WHERE DurationDays > 5 AND Price < 2000.00;

-- Query 24: Selects all bookings where the number of people is greater than 2.
SELECT * FROM Bookings
WHERE NumberOfPeople > 2;

-- Query 25: Selects all reviews with a rating of 4 or higher.
SELECT * FROM Reviews
WHERE Rating >= 4;

-- Query 26: Selects all payments made by credit card or PayPal.
SELECT * FROM Payments
WHERE PaymentMethod = 'Credit Card' OR PaymentMethod = 'PayPal';

-- Query 27: Selects all accommodations with a checkout date after July 7, 2024.
SELECT * FROM Accommodations
WHERE CheckOutDate > '2024-07-07';

-- Query 28: Selects all flights departing between July 1, 2024, and July 31, 2024.
SELECT * FROM Transport
WHERE TransportType = 'Flight' AND DepartureDate BETWEEN '2024-07-01' AND '2024-07-31';

-- Query 29: Selects all tourists who are from the USA or the UK.
SELECT * FROM Tourists
WHERE Nationality = 'USA' OR Nationality = 'British';

-- Query 30: Counts the number of reviews each tourist has written.
SELECT T.TouristID, T.FirstName, T.LastName, COUNT(R.ReviewID) AS NumberOfReviews
FROM Tourists T
JOIN Reviews R ON T.TouristID = R.TouristID
GROUP BY T.TouristID, T.FirstName, T.LastName;

-- Query 31: Sums the total number of people for each tour and selects the tour with the most people.
SELECT T.TourName, SUM(B.NumberOfPeople) AS TotalPeople
FROM Tours T
JOIN Bookings B ON T.TourID = B.TourID
GROUP BY T.TourID, T.TourName
ORDER BY TotalPeople DESC
LIMIT 1;

-- Query 32: Counts the number of destinations for each tour.
SELECT T.TourName, COUNT(D.DestinationID) AS NumberOfDestinations
FROM Tours T
JOIN Destinations D ON T.TourID = D.TourID
GROUP BY T.TourID, T.TourName;

-- Query 33: Selects the most expensive tour.
SELECT TourName, Price
FROM Tours
ORDER BY Price DESC
LIMIT 1;

-- Query 34: Selects the first name and last name of tourists who have not written any reviews.
SELECT T.FirstName, T.LastName
FROM Tourists T
LEFT JOIN Reviews R ON T.TouristID = R.TouristID
WHERE R.ReviewID IS NULL;

-- Query 35: Calculates the average number of people per booking.
SELECT AVG(NumberOfPeople) AS AverageNumberOfPeople
FROM Bookings;

-- Query 36: Selects the shortest tour by duration.
SELECT TourName, DurationDays
FROM Tours
ORDER BY DurationDays ASC
LIMIT 1;

-- Query 37: Selects tourists and their booking dates for bookings made between April 1, 2024, and May 1, 2024.
SELECT T.FirstName, T.LastName, B.BookingDate
FROM Tourists T
JOIN Bookings B ON T.TouristID = B.TouristID
WHERE B.BookingDate BETWEEN '2024-04-01' AND '2024-05-01';

-- Query 38: Sums the total amount paid for each tour.
SELECT T.TourName, SUM(P.Amount) AS TotalAmountPaid
FROM Tours T
JOIN Bookings B ON T.TourID = B.TourID
JOIN Payments P ON B.BookingID = P.BookingID
GROUP BY T.TourID, T.TourName;

-- Query 39: Selects the first name, last name, and the number of tours each guide is assigned to, filtering to those with more than one tour.
SELECT G.FirstName, G.LastName, COUNT(TG.TourID) AS NumberOfTours
FROM Guides G
JOIN TourGuides TG ON G.GuideID = TG.GuideID
GROUP BY G.GuideID, G.FirstName, G.LastName
HAVING COUNT(TG.TourID) > 1;

-- Query 40: Retrieves booking and payment details, including the payment method.
SELECT B.BookingID, B.BookingDate, P.PaymentDate, P.Amount, P.PaymentMethod
FROM Bookings B
JOIN Payments P ON B.BookingID = P.BookingID;

-- Query 41: Calculates the average rating for each tour.
SELECT T.TourName, AVG(R.Rating) AS AverageRating
FROM Tours T
JOIN Reviews R ON T.TourID = R.TourID
GROUP BY T.TourID, T.TourName;

-- Query 42: Selects the start and end dates of all tours.
SELECT TourName, StartDate, EndDate
FROM Tours;

-- Query 43: Counts the number of bookings for each month.
SELECT MONTH(BookingDate) AS BookingMonth, COUNT(BookingID) AS NumberOfBookings
FROM Bookings
GROUP BY BookingMonth;

-- Query 44: Selects guides who are not assigned to any tours.
SELECT G.FirstName, G.LastName
FROM Guides G
LEFT JOIN TourGuides TG ON G.GuideID = TG.GuideID
WHERE TG.TourID IS NULL;

-- Query 45: Counts the number of reviews each tour has received.
SELECT T.TourName, COUNT(R.ReviewID) AS NumberOfReviews
FROM Tours T
JOIN Reviews R ON T.TourID = R.TourID
GROUP BY T.TourID, T.TourName;

-- Query 46: Counts the number of distinct tours each tourist has booked, filtering to those with more than one tour.
SELECT T.FirstName, T.LastName, COUNT(DISTINCT B.TourID) AS NumberOfTours
FROM Tourists T
JOIN Bookings B ON T.TouristID = B.TouristID
GROUP BY T.TouristID, T.FirstName, T.LastName
HAVING COUNT(DISTINCT B.TourID) > 1;

-- Query 47: Retrieves destination details along with the tour name they belong to.
SELECT D.DestinationName, T.TourName, D.VisitDate
FROM Destinations D
JOIN Tours T ON D.TourID = T.TourID;

-- Query 48: Calculates the average duration of all tours.
SELECT AVG(DurationDays) AS AverageDuration
FROM Tours;

-- Query 49: Counts the number of tourists who have given a rating of 5.
SELECT COUNT(DISTINCT R.TouristID) AS NumberOfTourists
FROM Reviews R
WHERE R.Rating = 5;

-- Query 50: Retrieves recent bookings (within the last month) along with tourist details.
SELECT B.BookingID, B.BookingDate, T.FirstName, T.LastName
FROM Bookings B
JOIN Tourists T ON B.TouristID = T.TouristID
WHERE B.BookingDate > DATE_SUB(CURDATE(), INTERVAL 1 MONTH);

-- Query 51: Sums the total amount paid for bookings made in the last year.
SELECT SUM(P.Amount) AS TotalAmountPaid
FROM Payments P
JOIN Bookings B ON P.BookingID = B.BookingID
WHERE B.BookingDate > DATE_SUB(CURDATE(), INTERVAL 1 YEAR);

-- Query 52: Selects distinct hotel names from accommodations.
SELECT DISTINCT HotelName
FROM Accommodations;

-- Query 53: Counts the number of tourists from each nationality.
SELECT Nationality, COUNT(TouristID) AS NumberOfTourists
FROM Tourists
GROUP BY Nationality;

-- Query 54: Selects distinct transport types from the transport table.
SELECT DISTINCT TransportType
FROM Transport;

-- Query 55: Selects the longest tour by duration.
SELECT TourName, DurationDays, StartDate, EndDate
FROM Tours
ORDER BY DurationDays DESC
LIMIT 1;

-- Query 56: Selects tours ending in June.
SELECT TourName, EndDate
FROM Tours
WHERE MONTH(EndDate) = 6;

-- Query 57: Selects the first name, last name, and email of tourists who share a last name with other tourists.
SELECT FirstName, LastName, Email
FROM Tourists
WHERE LastName IN (
    SELECT LastName
    FROM Tourists
    GROUP BY LastName
    HAVING COUNT(*) = 1
);

-- Query 58: Counts the number of bookings made by tourists younger than 30.
SELECT COUNT(B.BookingID) AS NumberOfBookings
FROM Bookings B
JOIN Tourists T ON B.TouristID = T.TouristID
WHERE YEAR(CURDATE()) - YEAR(T.DateOfBirth) < 30;

-- Query 59: Counts the number of guides assigned to each tour.
SELECT T.TourName, COUNT(TG.GuideID) AS NumberOfGuides
FROM Tours T
JOIN TourGuides TG ON T.TourID = TG.TourID
GROUP BY T.TourID, T.TourName;

-- Query 60: Retrieves the most recent booking details along with tourist information.
SELECT B.BookingID, B.BookingDate, T.FirstName, T.LastName, B.NumberOfPeople, B.TotalPrice
FROM Bookings B
JOIN Tourists T ON B.TouristID = T.TouristID
ORDER BY B.BookingDate DESC
LIMIT 1;







