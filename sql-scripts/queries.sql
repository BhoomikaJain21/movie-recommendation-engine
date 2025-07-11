-- Average Rating for Each Movie

SELECT 
    M.Title,
    ROUND(AVG(R.Rating), 2) AS AverageRating
FROM 
    Ratings R
JOIN 
    Movies M ON R.MovieID = M.MovieID
GROUP BY 
    M.MovieID, M.Title
ORDER BY 
    AverageRating DESC;
    
    
-- Top 5 Highest Rated Movies

SELECT 
    M.Title,
    ROUND(AVG(R.Rating), 2) AS AverageRating
FROM 
    Ratings R
JOIN 
    Movies M ON R.MovieID = M.MovieID
GROUP BY 
    M.MovieID, M.Title
ORDER BY 
    AverageRating DESC
LIMIT 5;


-- Most Active Reviewers (Users with Most Reviews)

SELECT 
    U.Name,
    COUNT(Rev.ReviewID) AS ReviewCount
FROM 
    Reviews Rev
JOIN 
    Users U ON Rev.UserID = U.UserID
GROUP BY 
    U.UserID, U.Name
ORDER BY 
    ReviewCount DESC;
    
    
-- Movies with More Than 3 Ratings

SELECT 
    M.Title,
    COUNT(R.RatingID) AS RatingCount
FROM 
    Ratings R
JOIN 
    Movies M ON R.MovieID = M.MovieID
GROUP BY 
    M.MovieID, M.Title
HAVING 
    COUNT(R.RatingID) > 3
ORDER BY 
    RatingCount DESC;
    
    
-- Average Rating by Genre

SELECT 
    M.Genre,
    ROUND(AVG(R.Rating), 2) AS AvgGenreRating
FROM 
    Ratings R
JOIN 
    Movies M ON R.MovieID = M.MovieID
GROUP BY 
    M.Genre
ORDER BY 
    AvgGenreRating DESC;
    

-- User’s Highest Rated Movie

SELECT 
    U.Name,
    M.Title,
    R.Rating
FROM 
    Ratings R
JOIN 
    Users U ON R.UserID = U.UserID
JOIN 
    Movies M ON R.MovieID = M.MovieID
WHERE 
    (R.UserID, R.Rating) IN (
        SELECT 
            UserID, MAX(Rating)
        FROM 
            Ratings
        GROUP BY 
            UserID
    )
ORDER BY U.Name;


-- Users Who Rated More Than 3 Movies

SELECT 
    U.Name,
    COUNT(R.RatingID) AS TotalRatings
FROM 
    Ratings R
JOIN 
    Users U ON R.UserID = U.UserID
GROUP BY 
    U.UserID, U.Name
HAVING 
    COUNT(R.RatingID) > 3
ORDER BY 
    TotalRatings DESC;
    
    
-- Movies That Have Been Reviewed But Not Rated

SELECT DISTINCT 
    M.Title
FROM 
    Reviews Rev
JOIN 
    Movies M ON Rev.MovieID = M.MovieID
WHERE 
    M.MovieID NOT IN (
        SELECT DISTINCT MovieID FROM Ratings
    );


-- Recent Reviews (Last 5 Days)

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
    Rev.ReviewDate >= CURDATE() - INTERVAL 5 DAY
ORDER BY 
    Rev.ReviewDate DESC;
    
    
-- Top Rated Movie in Each Genre (Using Window Function)

SELECT * FROM (
    SELECT 
        M.Title,
        M.Genre,
        ROUND(AVG(R.Rating), 2) AS AvgRating,
        RANK() OVER (PARTITION BY M.Genre ORDER BY AVG(R.Rating) DESC) AS GenreRank
    FROM 
        Ratings R
    JOIN 
        Movies M ON R.MovieID = M.MovieID
    GROUP BY 
        M.MovieID, M.Title, M.Genre
) AS RankedMovies
WHERE GenreRank = 1;


-- Movie Popularity (Rated by Most Users)

SELECT 
    M.Title,
    COUNT(DISTINCT R.UserID) AS UserCount
FROM 
    Ratings R
JOIN 
    Movies M ON R.MovieID = M.MovieID
GROUP BY 
    M.MovieID, M.Title
ORDER BY 
    UserCount DESC;