-- Top 5 Recommended Movies: Movies with highest average rating (above 4.5), and at least 3 ratings

CREATE VIEW TopRecommendedMovies AS
SELECT 
    M.Title,
    ROUND(AVG(R.Rating), 2) AS AverageRating,
    COUNT(R.RatingID) AS TotalRatings
FROM 
    Ratings R
JOIN 
    Movies M ON R.MovieID = M.MovieID
GROUP BY 
    M.MovieID, M.Title
HAVING 
    AVG(R.Rating) > 4.5 AND COUNT(R.RatingID) >= 3
ORDER BY 
    AverageRating DESC;


SELECT * FROM TopRecommendedMovies;

    
-- Each User’s Top Rated Movie: Shows each user’s highest-rated movie

CREATE VIEW UserTopMovies AS
SELECT 
    U.Name AS UserName,
    M.Title AS MovieTitle,
    R.Rating
FROM 
    Ratings R
JOIN 
    Users U ON R.UserID = U.UserID
JOIN 
    Movies M ON R.MovieID = M.MovieID
WHERE 
    R.Rating = (
        SELECT MAX(R2.Rating)
        FROM Ratings R2
        WHERE R2.UserID = R.UserID
    );


SELECT * FROM UserTopMovies;


-- Average Rating by Genre: Simple view to track which genres perform best

CREATE VIEW GenreAverageRatings AS
SELECT 
    M.Genre,
    ROUND(AVG(R.Rating), 2) AS AvgRating
FROM 
    Ratings R
JOIN 
    Movies M ON R.MovieID = M.MovieID
GROUP BY 
    M.Genre
ORDER BY 
    AvgRating DESC;

    
SELECT * FROM GenreAverageRatings;    
    

-- Most Reviewed Movies: Movies with the most written reviews

CREATE VIEW MostReviewedMovies AS
SELECT 
    M.Title,
    COUNT(Rev.ReviewID) AS ReviewCount
FROM 
    Reviews Rev
JOIN 
    Movies M ON Rev.MovieID = M.MovieID
GROUP BY 
    M.MovieID, M.Title
ORDER BY 
    ReviewCount DESC;
    
    
SELECT * FROM MostReviewedMovies;    
    
    
-- User Activity Summary: Total number of ratings and reviews by each user

CREATE VIEW UserActivitySummary AS
SELECT 
    U.Name,
    COUNT(DISTINCT R.RatingID) AS TotalRatings,
    COUNT(DISTINCT Rev.ReviewID) AS TotalReviews
FROM 
    Users U
LEFT JOIN Ratings R ON U.UserID = R.UserID
LEFT JOIN Reviews Rev ON U.UserID = Rev.UserID
GROUP BY 
    U.UserID, U.Name
ORDER BY 
    TotalRatings DESC;
    
    
SELECT * FROM UserActivitySummary;    
    
    
-- Movies with Rating < 4 and More Than 3 Ratings: To flag average or poorly rated movies for recommendation filtering

CREATE VIEW LowRatedMovies AS
SELECT 
    M.Title,
    ROUND(AVG(R.Rating), 2) AS AvgRating,
    COUNT(R.RatingID) AS RatingCount
FROM 
    Ratings R
JOIN 
    Movies M ON R.MovieID = M.MovieID
GROUP BY 
    M.MovieID, M.Title
HAVING 
    AVG(R.Rating) < 4.0 AND COUNT(R.RatingID) >= 3
ORDER BY 
    AvgRating ASC;
    
    
SELECT * FROM LowRatedMovies;    
    
    
-- Recent Reviews (Last 7 Days): Automatically gives recent review activity

CREATE VIEW RecentReviews AS
SELECT 
    U.Name AS Reviewer,
    M.Title AS Movie,
    Rev.ReviewText,
    Rev.ReviewDate
FROM 
    Reviews Rev
JOIN 
    Users U ON Rev.UserID = U.UserID
JOIN 
    Movies M ON Rev.MovieID = M.MovieID
WHERE 
    Rev.ReviewDate >= CURDATE() - INTERVAL 7 DAY
ORDER BY 
    Rev.ReviewDate DESC;
    

SELECT * FROM RecentReviews;

    
-- Genre Popularity (by total number of ratings): Shows which genres are rated the most

CREATE VIEW GenrePopularity AS
SELECT 
    M.Genre,
    COUNT(R.RatingID) AS TotalRatings
FROM 
    Ratings R
JOIN 
    Movies M ON R.MovieID = M.MovieID
GROUP BY 
    M.Genre
ORDER BY 
    TotalRatings DESC;


SELECT * FROM GenrePopularity;