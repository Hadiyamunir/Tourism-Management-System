use TourismManagement;
-- Accommodations Table
CREATE TABLE Accommodations (
    AccommodationID INT AUTO_INCREMENT PRIMARY KEY,
    TourID INT,
    HotelName VARCHAR(100),
    CheckInDate DATE,
    CheckOutDate DATE,
    FOREIGN KEY (TourID) REFERENCES Tours(TourID)
);

-- Inserting sample data into Accommodations Table
INSERT INTO Accommodations (TourID, HotelName, CheckInDate, CheckOutDate) VALUES
(1, 'Hotel Europe', '2024-06-01', '2024-06-15'),
(2, 'Hotel Asia', '2024-07-10', '2024-07-20'),
(3, 'Safari Lodge', '2024-08-05', '2024-08-17');

-- Query 27: Selects all accommodations with a checkout date after July 7, 2024.
SELECT * FROM Accommodations
WHERE CheckOutDate > '2024-07-07';

-- Query 52: Selects distinct hotel names from accommodations.
SELECT DISTINCT HotelName
FROM Accommodations;