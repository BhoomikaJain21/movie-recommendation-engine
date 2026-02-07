# Movie Rating & Review Analysis using SQL

## Overview
This project analyzes movie ratings and user reviews using SQL to extract meaningful insights from relational data. The analysis focuses on identifying top-rated movies, user engagement patterns, genre-wise performance, and generating rule-based movie recommendations using SQL queries and views.

## Tech Stack
- MySQL
- SQL (Joins, Aggregations, Views, Window Functions)

## Key Features
- Average and top-rated movie analysis
- User activity and engagement tracking
- Genre-based rating and popularity insights
- Rule-based movie recommendation using SQL views
- Recent review monitoring and reporting

## SQL Concepts Used
- INNER JOIN, LEFT JOIN
- GROUP BY, HAVING
- Aggregate functions (AVG, COUNT)
- Subqueries
- Views
- Window functions (RANK)

## Recommendation Logic
Movie recommendations are generated using SQL-based ranking rules, primarily based on:
- Average movie ratings
- Minimum number of ratings to ensure reliability
This is a rule-based analytical system implemented using SQL, not a machine learning model.

## Files
- `queries.sql` — standalone analytical SQL queries
- `views.sql` — reusable SQL views for reporting and recommendations
