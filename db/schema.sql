CREATE DATABASE character_bank_db;

\c character_bank_db;

CREATE TABLE users(id SERIAL PRIMARY KEY, first_name TEXT, last_name TEXT, email TEXT, password_digest TEXT);

CREATE TABLE characters(id SERIAL PRIMARY KEY, user_id INTEGER,name TEXT, character_portrait TEXT, race TEXT, character_class TEXT, character_strength TEXT, character_flaw TEXT);