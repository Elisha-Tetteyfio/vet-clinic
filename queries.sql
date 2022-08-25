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

SELECT animals.name AS Melodys_animals
  FROM animals JOIN owners ON animals.owner_id=owners.id WHERE full_name='Melody Pond';
SELECT animals.name AS pokemon_animals 
  FROM animals JOIN species ON animals.species_id=species.id WHERE species.name='Pokemon';
SELECT full_name AS owner, name as animals FROM animals RIGHT JOIN owners ON animals.owner_id=owners.id;
SELECT species.name AS specie, COUNT(species.id)
  FROM animals JOIN species ON animals.species_id=species.id GROUP BY species.id;
SELECT animals.name, species.name AS specie, full_name AS owner 
  FROM animals JOIN species ON animals.species_id=species.id JOIN owners ON animals.owner_id=owners.id 
  WHERE species.name='Digimon' AND full_name='Jennifer Orwell' GROUP BY species.name, animals.name, full_name;
SELECT name AS animals 
  FROM animals JOIN owners ON animals.owner_id=owners.id WHERE full_name='Dean Winchester' AND escape_attempts=0;
SELECT full_name AS owner, COUNT(name) 
  FROM owners JOIN  animals ON  owners.id = owner_id GROUP BY owner ORDER BY COUNT DESC LIMIT 1;
