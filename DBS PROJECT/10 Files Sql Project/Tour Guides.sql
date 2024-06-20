use TourismManagement;
-- TourGuides Table (Many-to-Many Relationship between Tours and Guides)
CREATE TABLE TourGuides (
    TourID INT,
    GuideID INT,
    PRIMARY KEY (TourID, GuideID),
    FOREIGN KEY (TourID) REFERENCES Tours(TourID),
    FOREIGN KEY (GuideID) REFERENCES Guides(GuideID)
);

-- Inserting sample data into TourGuides Table
INSERT INTO TourGuides (TourID, GuideID) VALUES
(1, 1),
(2, 2),
(3, 3);