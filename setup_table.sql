create or replace database dbt_demo;

create table booking_1 (
  id INTEGER,
  booking_reference INTEGER,
  hotel STRING,
  booking_date DATE,
  cost INTEGER
); 

create table booking_2 (
  id INTEGER,
  booking_reference INTEGER,
  hotel STRING,
  booking_date DATE,
  cost INTEGER
); 

CREATE TABLE customers (
    id INTEGER,
    first_name STRING,
    last_name STRING,
    birthdate DATE,
    membership_no INTEGER
);