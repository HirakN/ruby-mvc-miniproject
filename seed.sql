DROP TABLE IF EXISTS sharks;

CREATE TABLE sharks (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255),
	length DECIMAL(4,2),
	species VARCHAR(255),
	habitat VARCHAR(255),
	status CHAR(2)
);

INSERT INTO sharks (name, length, species, habitat, status) VALUES ('Whale Shark', 12.65, 'Rhincodon typus', 'Tropical and warm-temperate seas.', 'EN');

INSERT INTO sharks (name, length, species, habitat, status) VALUES (
 'Great White Shark',
 6.1,
 'Carcharodon carcharias',
 'Coastal and offshore waters which have water temperature between 12 and 24 °C.',
 'VU');
INSERT INTO sharks (name, length, species, habitat, status) VALUES (
 'Tiger Shark',
 5.0,
 'Galeocerdo cuvier',
 'Mainly in tropical and subtropical waters throughout the world.',
 'NT');