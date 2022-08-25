/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES('Agumon', '2020-02-03', 10.23, true, 0);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES('Gabumon', '2018-11-15', 8, true, 2);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES('Pikachu', '2021-01-07', 15.04, false, 1);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES('Devimon', '2017-05-12', 11, true, 5);
/* I updated the records of 'Gabumon' and 'Deveimon', I changed their weights to decimal figures, '8.00' and '11.00' respectively */

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES('Charmander', '2020-02-08', -11.00, false, 0);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES('Plantmon', '2021-11-15', -5.70, true, 2);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES('Squirtle', '1993-04-02', -12.13, false, 3);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES('Angemon', '2005-06-12', -45.00, true, 1);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES('Boarmon', '2005-06-07', 20.40, true, 7);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES('Blossom', '1998-10-13', 17.00, true, 3);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES('Ditto', '2022-05-14', 22.00, true, 4);

/* Owners table data */
INSERT INTO owners (full_name, age) VALUES ('Sam Smith', 34);
INSERT INTO owners (full_name, age) VALUES ('Jennifer Orwell', 19);
INSERT INTO owners (full_name, age) VALUES ('Bob', 45);
INSERT INTO owners (full_name, age) VALUES ('Melody Pond', 77);
INSERT INTO owners (full_name, age) VALUES ('Dean Winchester', 14);
INSERT INTO owners (full_name, age) VALUES ('Jordie Whittaker', 38);

/* Add species table data */
INSERT INTO species(name) VALUES('Pokemon');
INSERT INTO species(name) VALUES('Digimon');

/* Modify animals table  - Set species*/
UPDATE animals SET species_id =2 WHERE name::text LIKE '%mon';
UPDATE animals SET species_id =1  WHERE species_id IS NULL;
/* Modify animals table  - Set owners*/
UPDATE animals SET owner_id =1 WHERE name= 'Agumon';
UPDATE animals SET owner_id =2 WHERE name= 'Gabumon' OR name='Pikachu';
UPDATE animals SET owner_id =3 WHERE name= 'Devimon' OR name='Plantmon';
UPDATE animals SET owner_id =4 WHERE name= 'Charmander' OR name='Squirtle' OR name='Blossom';
UPDATE animals SET owner_id =5 WHERE name= 'Angemon' OR name='Boarmon';



--how to join
--  select species.id, animals.name, species.name from animals join species on animals.species_id=species.id;