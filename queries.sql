/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name::text LIKE '%mon';
SELECT name from animals WHERE (date_of_birth < '2019-12-31') AND (date_of_birth > '2016-01-01');
SELECT name from animals WHERE (neutered = true) AND (escape_attempts < 3);
SELECT date_of_birth from animals WHERE (name = 'Agumon') OR (name = 'Pikachu');
SELECT name, escape_attempts from animals WHERE (weight_kg > 10.5);
SELECT * from animals WHERE (neutered);
SELECT * from animals WHERE (name != 'Gabumon');
SELECT * from animals WHERE (weight_kg >= 10.4) AND (weight_kg <=17.3);

SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT SUM(weight_kg)/COUNT(weight_kg) AS average_weight FROM animals;
SELECT neutered, COUNT(escape_attempts) AS escape_attempts FROM animals WHERE escape_attempts>0 GROUP BY neutered;
SELECT species, MAX(weight_kg), MIN(weight_kg) FROM animals GROUP BY species;
SELECT 
    species, SUM(escape_attempts)/COUNT(escape_attempts) AS average_escape_attempt FROM animals 
  WHERE(date_of_birth>'1990-01-01' AND date_of_birth<'2000-12-31')
  GROUP BY species;