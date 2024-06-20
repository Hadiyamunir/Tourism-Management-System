use TourismManagement;
-- Transport Table
CREATE TABLE Transport (
    TransportID INT AUTO_INCREMENT PRIMARY KEY,
    TourID INT,
    TransportType VARCHAR(50),
    DepartureDate DATE,
    ArrivalDate DATE,
    FOREIGN KEY (TourID) REFERENCES Tours(TourID)
);

-- Inserting sample data into Transport Table
INSERT INTO Transport (TourID, TransportType, DepartureDate, ArrivalDate) VALUES
(1, 'Flight', '2024-06-01', '2024-06-01'),
(2, 'Flight', '2024-07-10', '2024-07-10'),
(3, 'Flight', '2024-08-05', '2024-08-05');

-- Query 28: Selects all flights departing between July 1, 2024, and July 31, 2024.
SELECT * FROM Transport
WHERE TransportType = 'Flight' AND DepartureDate BETWEEN '2024-07-01' AND '2024-07-31';

-- Query 54: Selects distinct transport types from the transport table.
SELECT DISTINCT TransportType
FROM Transport;