DROP TABLE students;
DROP TABLE houses;

CREATE TABLE houses (
  id SERIAL8 PRIMARY KEY,
  house VARCHAR(255)
);

CREATE TABLE students (
  id SERIAL8 primary key,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  house INT8 REFERENCES houses ON DELETE CASCADE,
  age INT4
);
