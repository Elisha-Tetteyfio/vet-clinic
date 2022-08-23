/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name::text LIKE '%mon';
SELECT name from animals WHERE (date_of_birth < '2019-12-31') AND (date_of_birth > '2016-01-01');
SELECT name from animals WHERE (neutered = true) AND (escape_attempts < 3);
SELECT date_of_birth from animals WHERE (name = 'Agumon') OR (name = 'Pikachu');
SELECT name, escape_attempts from animals WHERE (weight_kg > 10.5);
SELECT * from animals WHERE (neutered);
SELECT * from animals WHERE (name != 'Gabumon');
SELECT * from animals WHERE (weight_kg >= 10.4) AND (weight_kg <=17.3);