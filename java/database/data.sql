BEGIN TRANSACTION;

INSERT INTO users (email,password_hash,role, phone_number, date_of_birth, first_name, last_name) VALUES ('user@te.net','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER', '123-456-7890', '2024-08-04', 'Test', 'User');
INSERT INTO users (email,password_hash,role, phone_number, date_of_birth, first_name, last_name) VALUES ('admin@te.net','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN', '123-456-7890', '2024-08-04', 'Test', 'Admin');

COMMIT TRANSACTION;
