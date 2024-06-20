use TourismManagement;
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

-- Inserting sample data into Bookings Table
INSERT INTO Bookings (TouristID, TourID, BookingDate, NumberOfPeople, TotalPrice) VALUES
(1, 1, '2024-04-01', 2, 5000.00),
(2, 2, '2024-05-01', 1, 1800.00),
(3, 3, '2024-06-01', 4, 12000.00);

-- Query 2: Calculates the total revenue generated from TourID 1.
SELECT SUM(B.TotalPrice) AS TotalRevenue
FROM Bookings B
WHERE B.TourID = 1;

-- Query 5: Retrieves details of the booking with BookingID 1, including tourist information.
SELECT B.BookingID, B.BookingDate, B.NumberOfPeople, B.TotalPrice, T.FirstName, T.LastName
FROM Bookings B
JOIN Tourists T ON B.TouristID = T.TouristID
WHERE B.BookingID = 1;

-- Query 12: Calculates the total revenue from all bookings.
SELECT SUM(TotalPrice) AS TotalRevenue
FROM Bookings;

-- Query 24: Selects all bookings where the number of people is greater than 2.
SELECT * FROM Bookings
WHERE NumberOfPeople > 2;

-- Query 35: Calculates the average number of people per booking.
SELECT AVG(NumberOfPeople) AS AverageNumberOfPeople
FROM Bookings;

-- Query 40: Retrieves booking and payment details, including the payment method.
SELECT B.BookingID, B.BookingDate, P.PaymentDate, P.Amount, P.PaymentMethod
FROM Bookings B
JOIN Payments P ON B.BookingID = P.BookingID;

-- Query 43: Counts the number of bookings for each month.
SELECT MONTH(BookingDate) AS BookingMonth, COUNT(BookingID) AS NumberOfBookings
FROM Bookings
GROUP BY BookingMonth;

-- Query 50: Retrieves recent bookings (within the last month) along with tourist details.
SELECT B.BookingID, B.BookingDate, T.FirstName, T.LastName
FROM Bookings B
JOIN Tourists T ON B.TouristID = T.TouristID
WHERE B.BookingDate > DATE_SUB(CURDATE(), INTERVAL 1 MONTH);

-- Query 58: Counts the number of bookings made by tourists younger than 30.
SELECT COUNT(B.BookingID) AS NumberOfBookings
FROM Bookings B
JOIN Tourists T ON B.TouristID = T.TouristID
WHERE YEAR(CURDATE()) - YEAR(T.DateOfBirth) < 30;

-- Query 60: Retrieves the most recent booking details along with tourist information.
SELECT B.BookingID, B.BookingDate, T.FirstName, T.LastName, B.NumberOfPeople, B.TotalPrice
FROM Bookings B
JOIN Tourists T ON B.TouristID = T.TouristID
ORDER BY B.BookingDate DESC