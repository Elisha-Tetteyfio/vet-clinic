/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id int,
    name TEXT,
    date_of_birth date,
    escape_attempts int,
    neutered boolean,
    weight_kg decimal
);

ALTER TABLE animals ADD species text;
