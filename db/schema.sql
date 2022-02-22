CREATE DATABASE character_bank_db;

\c character_bank_db;

CREATE TABLE users(id SERIAL PRIMARY KEY, first_name TEXT, last_name TEXT, email TEXT, password_digest TEXT);