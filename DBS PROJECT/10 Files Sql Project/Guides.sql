use TourismManagement;
-- Guides Table
CREATE TABLE Guides (
    GuideID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    PhoneNumber VARCHAR(15),
    Email VARCHAR(100) UNIQUE
);

-- Inserting sample data into Guides Table
INSERT INTO Guides (FirstName, LastName, PhoneNumber, Email) VALUES
('Ali', 'Zahid', '5551234567', 'ali.zahid@example.com'),
('Badar', 'Hussain', '5559876543', 'badar.hussain@example.com'),
('Hina', 'Basit', '5554567890', 'hina.basit@example.com');

-- Query 4: Selects the first name, last name, and email of guides assigned to TourID 1.
SELECT G.FirstName, G.LastName, G.Email
FROM Guides G
JOIN TourGuides TG ON G.GuideID = TG.GuideID
WHERE TG.TourID = 1;

-- Query 39: Selects the first name, last name, and the number of tours each guide is assigned to, filtering to those with more than one tour.
SELECT G.FirstName, G.LastName, COUNT(TG.TourID) AS NumberOfTours
FROM Guides G
JOIN TourGuides TG ON G.GuideID = TG.GuideID
GROUP BY G.GuideID, G.FirstName, G.LastName
HAVING COUNT(TG.TourID) > 1;

-- Query 44: Selects guides who are not assigned to any tours.
SELECT G.FirstName, G.LastName
FROM Guides G
LEFT JOIN TourGuides TG ON G.GuideID = TG.GuideID
WHERE TG.TourID IS NULL;