-- Active: 1737751175318@@127.0.0.1@3306@assignment_01_db
SHOW DATABASES;

-- create DB for assignment 01
CREATE DATABASE assignment_01_DB;

-- select assignment 01 DB
use assignment_01_DB;

-- create city table
create Table if not exists city_v1
(
    id INT,
    name VARCHAR(17),
    countrycode VARCHAR(10),
    district VARCHAR(20),
    population DOUBLE
);

-- importing data from csv file into the city table
-- First check secure-file-priv directory
SHOW VARIABLES LIKE 'secure_file_priv';

DESCRIBE city_v1;

-- Move the CSV file to secure-file-priv directory, then load it
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/City_Table1.csv'
INTO TABLE city_v1
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM city_v1;

-- Q1
SELECT * FROM city_v1
WHERE population > 100000 and countrycode = 'USA';

-- Q2
SELECT name from city_v1
where countrycode = 'usa' and population > 120000;

-- Q3
SELECT * FROM city_v1;

-- Q4
SELECT * from city_v1
WHERE id = 1661;

-- Q5
SELECT * FROM city_v1
WHERE countrycode = 'jpn';

-- Q6
SELECT name from city_v1
WHERE countrycode='jpn';

-- creating station table
DROP TABLE station;

CREATE TABLE if not exists station
(
    id INT DEFAULT NULL,
    city VARCHAR(50) DEFAULT NULL,
    state VARCHAR(5) DEFAULT NULL,
    lat_n DOUBLE DEFAULT NULL,
    long_w DOUBLE DEFAULT NULL
);

-- importing station table
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/stationdata.csv'
INTO TABLE station
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Q7
SELECT city, state from station;

-- Q8
SELECT DISTINCT(city) as city_name, id FROM station
WHERE id%2 = 0 ;

-- Q9
SELECT COUNT(city)-COUNT(DISTINCT(city)) as diff from station;
-- solution from growdata
SELECT COUNT(CITY) AS TOTAL_NUMBER_OF_RECORDS,COUNT(DISTINCT(CITY)) AS
NUMBER_OF_UNIQUE_CITY_NAMES,(COUNT(CITY) - COUNT(DISTINCT(CITY))) AS
DIFFERENCE_CITY_COUNT FROM STATION;

-- Q10
SELECT LENGTH(city) as char_count, city FROM station
ORDER BY char_count, city asc LIMIT 1;

SELECT LENGTH(city) as char_count, city FROM station
ORDER BY char_count DESC, city DESC LIMIT 1;

-- Q11
SELECT DISTINCT(city) from station
where lcase(city) LIKE 'a%'
or lcase(city) LIKE 'e%'
or lcase(city) LIKE 'i%'
or lcase(city) LIKE 'o%'
or lcase(city) LIKE 'o%'
ORDER BY city;

-- Q12
SELECT DISTINCT(city) from station
where lcase(city) LIKE '%a'
or lcase(city) LIKE '%e'
or lcase(city) LIKE '%i'
or lcase(city) LIKE '%o'
or lcase(city) LIKE '%u'
ORDER BY city;