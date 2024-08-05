BEGIN TRANSACTION;

DROP TABLE IF EXISTS users;
--DROP TABLE IF EXISTS registration;
DROP TABLE IF EXISTS pets;
--DROP TABLE IF EXISTS photos;

CREATE TABLE users (
	user_id SERIAL,
	username varchar(50) NOT NULL UNIQUE,
	password_hash varchar(200) NOT NULL,
	role varchar(50) NOT NULL,
--	phone_number varchar(12) NOT NULL,
--	date_of_birth DATE NOT NULL,
--	first_name varchar(25) NOT NULL,
--	last_name varchar(25) NOT NULL,
--	password_set boolean DEFAULT FALSE,
	CONSTRAINT PK_user PRIMARY KEY (user_id)
);

--CREATE TABLE registration (
--    registration_id SERIAL,
--    email varchar(50) NOT NULL UNIQUE,
--    phone_number varchar(12) NOT NULL,
--    date_of_birth DATE NOT NULL,
--    first_name varchar(25) NOT NULL,
--    last_name varchar(25) NOT NULL,
--    status varchar(10) DEFAULT 'pending',
--    CONSTRAINT PK_registration PRIMARY KEY (registration_id)
--);
--
CREATE TABLE pets (
    pet_id SERIAL,
    species varchar(3) NOT NULL,
    gender varchar(6) NOT NULL,
    age integer NOT NULL,
    name varchar(25) NOT NULL,
    breed varchar(25) NOT NULL,
    pet_size varchar(25) NOT NULL,
    color varchar(25) NOT NULL,
    description TEXT,
    profile_pic varchar(2048) NOT NULL,
    is_adopted boolean DEFAULT FALSE,
    CONSTRAINT PK_pets PRIMARY KEY (pet_id)
);
--
--CREATE TABLE photos (
--    photo_id SERIAL,
--    pet_id integer NOT NULL,
--    photo_url TEXT NOT NULL,
--    CONSTRAINT PK_photos PRIMARY KEY (photo_id),
--    CONSTRAINT FK_photos_table FOREIGN KEY (pet_id) REFERENCES pets (pet_id)
--
--);


COMMIT TRANSACTION;
