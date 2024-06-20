use TourismManagement;
-- Payments Table
CREATE TABLE Payments (
    PaymentID INT AUTO_INCREMENT PRIMARY KEY,
    BookingID INT,
    PaymentDate DATE,
    Amount DECIMAL(10, 2),
    PaymentMethod VARCHAR(50),
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID)
);

-- Inserting sample data into Payments Table
INSERT INTO Payments (BookingID, PaymentDate, Amount, PaymentMethod) VALUES
(1, '2024-04-02', 5000.00, 'Credit Card'),
(2, '2024-05-02', 1800.00, 'PayPal'),
(3, '2024-06-02', 12000.00, 'Bank Transfer');

-- Query 16: Calculates the average amount paid in all payments.
SELECT AVG(P.Amount) AS AverageAmountPaid
FROM Payments P;

-- Query 26: Selects all payments made by credit card or PayPal.
SELECT * FROM Payments
WHERE PaymentMethod = 'Credit Card' OR PaymentMethod = 'PayPal';

-- Query 51: Sums the total amount paid for bookings made in the last year.
SELECT SUM(P.Amount) AS TotalAmountPaid
FROM Payments P
JOIN Bookings B ON P.BookingID = B.BookingID
WHERE B.BookingDate > DATE_SUB(CURDATE(), INTERVAL 1 YEAR);