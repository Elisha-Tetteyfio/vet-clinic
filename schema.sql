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

CREATE TABLE owners(
    id SERIAL PRIMARY KEY,
    full_name text,
    age int
);

CREATE TABLE species( id SERIAL PRIMARY KEY, name text);

ALTER TABLE animals DROP COLUMN id;
ALTER TABLE animals ADD COLUMN id SERIAL PRIMARY KEY;
ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD species_id INT;
ALTER TABLE animals ADD FOREIGN KEY (species_id) REFERENCES species;
ALTER TABLE animals ADD owner_id INT;
ALTER TABLE animals ADD FOREIGN KEY (owner_id) REFERENCES owners;

CREATE TABLE vets (
    id SERIAL PRIMARY KEY,
    name TEXT,
    age INT,
    date_of_graduation DATE
);

CREATE TABLE specializations (
    species_id INT,
    vets_id INT,
    PRIMARY KEY(species_id, vets_id),
    FOREIGN KEY (species_id) REFERENCES species(id),
    FOREIGN KEY (vets_id) REFERENCES vets(id)
);


CREATE TABLE visits (
    animals_id INT,
    vets_id INT,
    date_of_visit DATE,
    PRIMARY KEY(animals_id, vets_id, date_of_visit),
    FOREIGN KEY (animals_id) REFERENCES animals(id),
    FOREIGN KEY (vets_id) REFERENCES vets(id)
);

