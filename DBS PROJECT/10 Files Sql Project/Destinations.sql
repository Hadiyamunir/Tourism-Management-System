use TourismManagement;
-- Destinations Table
CREATE TABLE Destinations (
    DestinationID INT AUTO_INCREMENT PRIMARY KEY,
    TourID INT,
    DestinationName VARCHAR(100),
    VisitDate DATE,
    Description TEXT,
    FOREIGN KEY (TourID) REFERENCES Tours(TourID)
);

-- Inserting sample data into Destinations Table
INSERT INTO Destinations (TourID, DestinationName, VisitDate, Description) VALUES
(1, 'Paris', '2024-06-02', 'Visit the Eiffel Tower and other landmarks.'),
(2, 'Tokyo', '2024-07-11', 'Experience the vibrant culture and technology.'),
(3, 'Serengeti', '2024-08-06', 'Explore the vast savannah and wildlife.');

-- Query 7: Retrieves details of destinations associated with TourID 1.
SELECT D.DestinationName, D.VisitDate, D.Description
FROM Destinations D
WHERE D.TourID = 1;

-- Query 21: Updates the description of the destination with DestinationID 1.
UPDATE Destinations
SET Description = 'A breathtaking park with a wide variety of wildlife.'
WHERE DestinationID = 1;

-- Query 47: Retrieves destination details along with the tour name they belong to.
SELECT D.DestinationName, T.TourName, D.VisitDate
FROM Destinations D
JOIN Tours T ON D.TourID = T.TourID;