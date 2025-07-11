# Movie Review and Recommendation Engine

## Project Overview
This project implements a Movie Review and Recommendation Engine using MySQL. It stores movies, users, ratings, and reviews, and provides analytical queries and views to generate recommendations and insights.

## Features
- Database schema includes tables for Movies, Users, Ratings, and Reviews.
- Sample data insertion with realistic movie titles and user names.
- Queries to calculate average ratings, top-rated movies, user activity, and genre-based analysis.
- Views for top recommended movies, user top-rated movies, genre averages, and more.
- Exportable query results for reporting and presentation.

## Technologies Used
- MySQL (MySQL Workbench)
- SQL (DDL, DML, Views, Queries)

## Setup Instructions
1. Open MySQL Workbench and connect to your MySQL server.
2. Execute the SQL script file `schema.sql` to create the tables.
3. Execute `insert_data.sql` to insert sample data.
4. Run the queries in `queries.sql` to analyze data.
5. Create views by running `views.sql`.
6. Export data from views or queries as needed for reports.

## File Structure
- `/sql-scripts/` — Contains all SQL files (schema, inserts, queries, views).
- `/exports/` — Excel exports of key view results.
- `/docs/` — Project report PDF.
- `README.md` — Project overview and instructions.

## How to Use
- Use the provided SQL scripts to set up the database.
- Explore the views to get recommendations and insights.
- Extend or modify the project by adding more movies, users, or features.