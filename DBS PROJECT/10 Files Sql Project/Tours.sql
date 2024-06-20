use TourismManagement;
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

-- Inserting sample data into Tours Table
INSERT INTO Tours (TourName, Description, DurationDays, Price, StartDate, EndDate) VALUES
('Grand Europe Tour', 'Explore the beauty of Europe.', 15, 2500.00, '2024-06-01', '2024-06-15'),
('Asian Adventure', 'Discover the wonders of Asia.', 10, 1800.00, '2024-07-10', '2024-07-20'),
('African Safari', 'Experience the wilds of Africa.', 12, 3000.00, '2024-08-05', '2024-08-17');

-- Query 3: Retrieves the name and average rating of each tour.
SELECT TourName, AVG(Rating) AS AverageRating
FROM Tours T
JOIN Reviews R ON T.TourID = R.TourID
GROUP BY T.TourID, T.TourName;

-- Query 6: Selects the distinct tour names that have a perfect rating of 5.
SELECT DISTINCT T.TourName
FROM Tours T
JOIN Reviews R ON T.TourID = R.TourID
WHERE R.Rating = 5;

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

-- Query 13: Counts the number of tourists for each tour.
SELECT T.TourName, COUNT(B.BookingID) AS NumberOfTourists
FROM Tours T
JOIN Bookings B ON T.TourID = B.TourID
GROUP BY T.TourID, T.TourName;

-- Query 17: Retrieves the names and start dates of tours starting in June.
SELECT TourName, StartDate
FROM Tours
WHERE MONTH(StartDate) = 6;

-- Query 20: Updates the price of the tour with TourID 1.
UPDATE Tours
SET Price = 1800.00
WHERE TourID = 1;

-- Query 23: Selects all tours that have a duration greater than 5 days and a price less than $2000.
SELECT * FROM Tours
WHERE DurationDays > 5 AND Price < 2000.00;

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

-- Query 36: Selects the shortest tour by duration.
SELECT TourName, DurationDays
FROM Tours
ORDER BY DurationDays ASC
LIMIT 1;

-- Query 38: Sums the total amount paid for each tour.
SELECT T.TourName, SUM(P.Amount) AS TotalAmountPaid
FROM Tours T
JOIN Bookings B ON T.TourID = B.TourID
JOIN Payments P ON B.BookingID = P.BookingID
GROUP BY T.TourID, T.TourName;

-- Query 41: Calculates the average rating for each tour.
SELECT T.TourName, AVG(R.Rating) AS AverageRating
FROM Tours T
JOIN Reviews R ON T.TourID = R.TourID
GROUP BY T.TourID, T.TourName;

-- Query 42: Selects the start and end dates of all tours.
SELECT TourName, StartDate, EndDate
FROM Tours;

-- Query 45: Counts the number of reviews each tour has received.
SELECT T.TourName, COUNT(R.ReviewID) AS NumberOfReviews
FROM Tours T
JOIN Reviews R ON T.TourID = R.TourID
GROUP BY T.TourID, T.TourName;

-- Query 48: Calculates the average duration of all tours.
SELECT AVG(DurationDays) AS AverageDuration
FROM Tours;

-- Query 55: Selects the longest tour by duration.
SELECT TourName, DurationDays, StartDate, EndDate
FROM Tours
ORDER BY DurationDays DESC
LIMIT 1;

-- Query 56: Selects tours ending in June.
SELECT TourName, EndDate
FROM Tours
WHERE MONTH(EndDate) = 6;

-- Query 59: Counts the number of guides assigned to each tour.
SELECT T.TourName, COUNT(TG.GuideID) AS NumberOfGuides
FROM Tours T
JOIN TourGuides TG ON T.TourID = TG.TourID
GROUP BY T.TourID, T.TourName;