-- STRING FUNCTION
SELECT CONCAT(ID, ' ', name) AS name FROM student;
SELECT SUBSTRING_INDEX(title, ' ', 1) AS result FROM course;
SELECT SUBSTR(title, 1, 5) AS substr FROM course;
SELECT LENGTH(title) AS panjang FROM course;
SELECT DISTINCT REPLACE(title, 'ff', 'gg') AS result FROM course WHERE title LIKE '%ff%';
SELECT TRIM(BOTH 'ni' FROM building) FROM classroom WHERE building LIKE '%ni%';
SELECT UPPER(title) AS judul_upper FROM course;
SELECT LOWER(title) AS judul_lower FROM course;

-- MATH FUNCTION
SELECT ABS(start_min - end_min) AS result FROM time_slot;
SELECT SUM(end_hr) AS result FROM time_slot;
SELECT CEIL(ABS(start_min - end_min) / 3) AS result FROM time_slot;
SELECT FLOOR(ABS(start_min - end_min) / 3) AS result FROM time_slot;
SELECT ROUND(ABS(start_min - end_min) / 6) AS result FROM time_slot;
SELECT SQRT(end_hr) AS result FROM time_slot;
SELECT MOD(end_hr, 3) AS result FROM time_slot;
SELECT EXP(end_hr) AS result FROM time_slot;

-- DATE FUNCTION
SELECT CURRENT_DATE() AS curr_date;
SELECT CURRENT_TIME() AS curr_time;
SELECT CURRENT_TIMESTAMP() AS curr_time_date;
SELECT TIMESTAMP('2017-07-23') AS res;

-- AGGREGATION FUNCTION
SELECT * FROM classroom;
SELECT SUM(capacity) AS sum FROM classroom WHERE building = 'Main';
SELECT dept_name, COUNT(*) AS jumlah FROM student GROUP BY dept_name;
SELECT AVG(capacity) AS avg_room FROM classroom;
SELECT MIN(capacity) AS min_room FROM classroom;
SELECT MAX(capacity) AS max_room FROM classroom;
SELECT FIRST_VALUE(capacity) OVER (ORDER BY room_number) AS first_val FROM classroom;

