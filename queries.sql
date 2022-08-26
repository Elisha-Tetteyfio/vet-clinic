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

--Last animal seen by William Tatcher
SELECT animals.name AS last_animal_seen_by_william, date_of_visit 
  FROM animals JOIN visits ON animals.id = visits.animals_id JOIN vets ON visits.vets_id=vets.id 
  WHERE vets.name='William Tatcher' 
  ORDER BY date_of_visit DESC LIMIT 1;
--Different animals Stephanie Mendez saw
SELECT COUNT(animals.name) AS animals_seen_by_stephanie 
  FROM animals JOIN visits ON animals.id=visits.animals_id JOIN vets ON visits.vets_id=vets.id 
  WHERE vets.name='Stephanie Mendez';
--Vets and their specialty
SELECT vets.name AS vets, species.name AS specialty 
  FROM vets LEFT JOIN specializations ON vets.id=specializations.vets_id LEFT JOIN species ON specializations.species_id=species.id;
--Animals Stephanie Mendez saw between 1st April and 30th August 2020
SELECT animals.name AS animals, date_of_visit 
  FROM animals JOIN visits ON animals.id=visits.animals_id JOIN vets ON visits.vets_id=vets.id 
  WHERE vets.name='Stephanie Mendez' AND date_of_visit>'2020-04-01' AND date_of_visit<'2020-08-30';
--Animal with the most visits to vets
SELECT animals.name AS animal_with_most_visits, COUNT(animals.name) AS number_of_visits 
  FROM animals JOIN visits ON animals.id=visits.animals_id 
  GROUP BY animals.name 
  ORDER BY number_of_visits DESC LIMIT 1;
--Maisy Smith's first visit;
SELECT animals.name, date_of_visit 
  FROM animals JOIN visits ON animals.id=visits.animals_id JOIN vets ON visits.vets_id=vets.id 
  WHERE vets.name='Maisy Smith' 
  ORDER BY date_of_visit LIMIT 1;
--Details for most recent visit
SELECT animals, vets, date_of_visit 
  FROM animals JOIN visits ON animals.id=visits.animals_id JOIN vets ON visits.vets_id=vets.id 
  ORDER BY date_of_visit DESC LIMIT 1;
SELECT animals.species_id, animals.name, vets.name, specializations.species_id 
  FROM animals JOIN visits ON animals.id=visits.animals_id JOIN vets ON visits.vets_id=vets.id LEFT JOIN specializations ON vets.id=specializations.vets_id 
  WHERE animals.species_id != specializations.species_id OR specializations.species_id IS NULL;
--Maizy Smith's most cases
SELECT species.name AS species, COUNT(species.name) 
  FROM species JOIN animals ON species.id=animals.species_id JOIN visits ON animals.id=visits.animals_id JOIN vets ON vets.id=visits.vets_id 
  WHERE vets.name='Maisy Smith' 
  GROUP BY species.name, vets.name 
  ORDER BY count DESC LIMIT 1;






