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

-- Inserting sample data into Tourists Table
INSERT INTO Tourists (FirstName, LastName, Email, PhoneNumber, PassportNumber, DateOfBirth, Nationality) VALUES
('Faroog', 'Hassan', 'farooq.hassan@example.com', '1234567890', 'A1234567', '1985-01-15', 'USA'),
('Munir', 'Ahmed', 'munir.ahmed@example.com', '0987654321', 'B7654321', '1990-06-25', 'Canada'),
('Muzna', 'Ali', 'muzna.ali@example.com', '5432167890', 'C9876543', '1995-03-10', 'UK');

-- Query 1: Selects the first name, last name, and email of tourists who have booked TourID 1.
SELECT T.FirstName, T.LastName, T.Email
FROM Tourists T
JOIN Bookings B ON T.TouristID = B.TouristID
WHERE B.TourID = 1;

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

-- Query 14: Counts the number of bookings each tourist has made, filtering to those with more than one booking.
SELECT T.FirstName, T.LastName, COUNT(B.BookingID) AS NumberOfBookings
FROM Tourists T
JOIN Bookings B ON T.TouristID = B.TouristID
GROUP BY T.TouristID, T.FirstName, T.LastName
HAVING COUNT(B.BookingID) = 1;

-- Query 18: Selects the first name, last name, and nationality of tourists who are from the USA.
SELECT FirstName, LastName, Nationality
FROM Tourists
WHERE Nationality = 'USA';

-- Query 19: Updates the phone number of the tourist with TouristID 1.
UPDATE Tourists
SET PhoneNumber = '1234567899'
WHERE TouristID = 1;

-- Query 29: Selects all tourists who are from the USA or the UK.
SELECT * FROM Tourists
WHERE Nationality = 'USA' OR Nationality = 'British';

-- Query 30: Counts the number of reviews each tourist has written.
SELECT T.TouristID, T.FirstName, T.LastName, COUNT(R.ReviewID) AS NumberOfReviews
FROM Tourists T
JOIN Reviews R ON T.TouristID = R.TouristID
GROUP BY T.TouristID, T.FirstName, T.LastName;

-- Query 34: Selects the first name and last name of tourists who have not written any reviews.
SELECT T.FirstName, T.LastName
FROM Tourists T
LEFT JOIN Reviews R ON T.TouristID = R.TouristID
WHERE R.ReviewID IS NULL;

-- Query 37: Selects tourists and their booking dates for bookings made between April 1, 2024, and May 1, 2024.
SELECT T.FirstName, T.LastName, B.BookingDate
FROM Tourists T
JOIN Bookings B ON T.TouristID = B.TouristID
WHERE B.BookingDate BETWEEN '2024-04-01' AND '2024-05-01';

-- Query 46: Counts the number of distinct tours each tourist has booked, filtering to those with more than one tour.
SELECT T.FirstName, T.LastName, COUNT(DISTINCT B.TourID) AS NumberOfTours
FROM Tourists T
JOIN Bookings B ON T.TouristID = B.TouristID
GROUP BY T.TouristID, T.FirstName, T.LastName
HAVING COUNT(DISTINCT B.TourID) > 1;

-- Query 53: Counts the number of tourists from each nationality.
SELECT Nationality, COUNT(TouristID) AS NumberOfTourists
FROM Tourists
GROUP BY Nationality;

-- Query 57: Selects the first name, last name, and email of tourists who share a last name with other tourists.
SELECT FirstName, LastName, Email
FROM Tourists
WHERE LastName IN (
    SELECT LastName
    FROM Tourists
    GROUP BY LastName
    HAVING COUNT(*) = 1
);