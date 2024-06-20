use TourismManagement;
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

-- Inserting sample data into Reviews Table
INSERT INTO Reviews (TourID, TouristID, Rating, Comment, ReviewDate) VALUES
(1, 1, 5, 'Amazing tour, highly recommended!', '2024-06-20'),
(2, 2, 4, 'Great experience, but could improve the accommodation.', '2024-07-25'),
(3, 3, 5, 'Incredible adventure, unforgettable!', '2024-08-20');

-- Query 15: Selects reviews for TourID 1 along with the first name and last name of the tourists who wrote them.
SELECT T.FirstName, T.LastName, R.Rating, R.Comment
FROM Reviews R
JOIN Tourists T ON R.TouristID = T.TouristID
WHERE R.TourID = 1;

-- Query 22: Updates the comment of the review with ReviewID 1.
UPDATE Reviews
SET Comment = 'Amazing experience! Highly recommend.'
WHERE ReviewID = 1;

-- Query 25: Selects all reviews with a rating of 4 or higher.
SELECT * FROM Reviews
WHERE Rating >= 4;

-- Query 49: Counts the number of tourists who have given a rating of 5.
SELECT COUNT(DISTINCT R.TouristID) AS NumberOfTourists
FROM Reviews R
WHERE R.Rating = 5;