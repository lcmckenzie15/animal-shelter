BEGIN TRANSACTION;

INSERT INTO users (username,password_hash,role) VALUES ('user@te.net','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin@te.net','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');

INSERT INTO pets(
	species, gender, age, name, breed, pet_size, color, description, profile_pic, is_adopted)
	VALUES ('Dog', 'Female', 2, 'Scarlet', 'Aussiedoodle Mini', 'Small', 'Gray, Tan, Black',
	'Always full of energy and ready to take on any play time you have for her. She is very lovely and is always waiting to see her favorite people and wanting attention from them.She can be a little on the noisy side when it comes to barking.',
			'https://drive.google.com/file/d/1YfB9G-SRhjyNoV-wCQI8za3wAcZIrJtW/view?usp=drive_link', false);

INSERT INTO pets(
	species, gender, age, name, breed, pet_size, color, description, profile_pic, is_adopted)
	VALUES ('Dog', 'Female', 12, 'Maggie', 'Boxer', 'Medium', 'Brown, White',
	'She is always wanting to be with her person. She is very cuddly and full of love. Her nickname is wiggle butts since she is always wiggling when she is excited. She can be a little on the loud side when barking.',
			'https://drive.google.com/file/d/1Asxu1rad1uoOpRGCH39lL1rz7aMgDEfH/view?usp=drive_link', false);

INSERT INTO pets(
	species, gender, age, name, breed, pet_size, color, description, profile_pic, is_adopted)
	VALUES ('Dog', 'Male', 2, 'Gus', 'Great Dane', 'X-Large', 'White, Black',
	'Gus is always looking for someone to give him attention. He loves the feeling of someone petting him and showing him love. He will always be by your side, sometimes a little too much. He is a real couch potato getting small short bursts of energy throughout the day. When it comes to barking, it is only to alert his family of possible danger.',
			'https://drive.google.com/file/d/1ZczJOVilhahfQZAxairMHkXylJyUqFDp/view?usp=drive_link', false);

INSERT INTO pets(
	species, gender, age, name, breed, pet_size, color, description, profile_pic, is_adopted)
	VALUES ('Dog', 'Female', 12, 'Demi', 'Afghan Hound',
	'Large', 'Cream', 'If you are looking for a nice calm couch potato companion, look no further. Demi is a very chill and laid back dog. She doesn’t have much energy to play, she is more into laying down and chilling out all day. She doesn’t move around much so she is good in small places. In terms of barking, she hardly ever barks, some don’t even know if she can bark.',
			'https://drive.google.com/file/d/1rrDhjDkX6-SZanBQpC03r-_gJCW5rFu5/view?usp=sharing', false);

INSERT INTO pets(
	species, gender, age, name, breed, pet_size, color, description, profile_pic, is_adopted)
	VALUES ('Dog', 'Female', 1, 'Bynx', 'Great Dane', 'X-Large', 'Blue',
			'Bynx is still a young puppy around 6 months old when making this listing. SInce she is still a puppy, she isn’t fully house trained and still learning. If you take this beautiful puppy home, you’ll get the full experience of raising your own puppy. She is big for her age, so expect a huge Great Dane when she is fully grown. She is still very energetic and full of curiosity during this phase of her life. In terms of her barking, she doesn’t bark much except to alert her family of possible danger.',
			'https://drive.google.com/file/d/1u1_SCkytmFUjYxjLd0jlV2Ygtj-x0zlL/view?usp=drive_link', false);

INSERT INTO pets(
	species, gender, age, name, breed, pet_size, color, description, profile_pic, is_adopted)
	VALUES ('Dog', 'Male', 3, 'Benji', 'Golden Doodle Mini', 'Medium', 'Golden, Tan',
			'Benji is a bundle of joy with a heart as big as his playful spirit. Always smiling and wagging his tail, he’s known for his enthusiastic greetings and kisses. This lovable goofball has an odd habit of munching on rocks but don’t let that distract you from his true talent; snuggling up and binge watching movies with anyone who needs a cozy companion. If you’re looking for a fun loving sidekick, Benji’s your guy!',
			'https://drive.google.com/file/d/1ASsLufu71QnNIuIlTBLlm4Sr4O3QGmGk/view?usp=drive_link', false);

INSERT INTO pets(
	species, gender, age, name, breed, pet_size, color, description, profile_pic, is_adopted)
	VALUES ('Cat', 'Male', 2, 'Cinnamon', 'Bengal', 'Medium', 'Orange',
			'Cinnamon is the ultimate furry friend, bursting with loyalty and love. After a rough start on the streets, he bounced back with a heart full of excitement and gratitude. Cinnamon’s always up for cuddles, can’t get enough of bubble baths, and is your go to buddy for fun outings. This lovable kitty will never leave your side and always knows the way back home. Ready for adventure? Cinnamon’s your perfect partner!',
			'https://drive.google.com/file/d/1GSUa4TXi5sYXKWCsmkvQtAg2Exiuz4mt/view?usp=drive_link', false);

INSERT INTO pets(
	species, gender, age, name, breed, pet_size, color, description, profile_pic, is_adopted)
	VALUES ('Cat', 'Female', 8, 'Maya', 'Short Hair Tabby', 'Large', 'Gray, Orange',
			'Maya is the ultimate cuddle buddy. This sweet furball is always ready to curl up on your bed and purr her way into your heart. If you try to brush her off, be prepared for some heavy back talk. Maya is not just a loving companion; she’s also the best listener, always there to hear you out and snuggle up for those late-night chats. When it comes to sleepovers, Maya is your perfect partner!',
			'https://drive.google.com/file/d/12rKZLmtVK5cdrX-pDk0zxzZ9u7EnVJbO/view?usp=drive_link', false);

INSERT INTO pets(
	species, gender, age, name, breed, pet_size, color, description, profile_pic, is_adopted)
	VALUES ('Cat', 'Male', 8, 'Tiger', 'Short Hair Tabby', 'Medium', 'Gray',
			'Tiger might be the quiet type, but he’s got a heart full of charm! He’s a master at staking out his favorite spot and sticking to it like a true king. Leave a door open, and he’ll pounce through with the grace of a feline ninja, his curiosity always leading the way. While he might get a bit jumpy at surprises, Tiger’s dedication to guarding his territory—and you—is unwavering. He’s your loyal little protector, making sure that no one, or anything, disturbs his cozy domain!',
			'https://drive.google.com/file/d/1xXTgB4RWbQXoZwHhkmQzTv1iSr_GKBqm/view?usp=drive_link', false);

INSERT INTO pets(
	species, gender, age, name, breed, pet_size, color, description, profile_pic, is_adopted)
	VALUES ('Cat', 'Male', 8, 'Kabuto', 'Domestic Shorthair', 'Medium', 'Tuxedo',
			'Meet Kabuto, the ultimate socialite of the cat world! This friendly feline thrives on human interaction, always eager to chat and be the center of attention. Kabuto’s love for conversation is matched only by his enthusiasm for food—he’s a true gourmand who’ll happily join you at mealtime and offer his purrs of approval. With Kabuto around, you can count on endless cuddles, playful banter, and a constant reminder of just how delightful life can be with a loving, food-loving furball by your side.',
			'https://drive.google.com/file/d/1wV-Rir94DN0w7TEXtbE3MDBFfM1mXOhy/view?usp=drive_link', false);

INSERT INTO pets(
	species, gender, age, name, breed, pet_size, color, description, profile_pic, is_adopted)
	VALUES ('Cat', 'Male', 2, 'Lucifer', 'Domestic Longhair', 'Medium', 'Black',
			'Meet Lucifer, the playful night owl of the cat world! This energetic furball is full of mischief and fun, especially when the moon is out. By day, he’s all about finding the coziest, darkest spots for his beauty sleep. But as soon as night falls, he’s on the prowl for toys and adventures. With Lucifer around, your nights will be lively and full of feline antics, while your days are perfectly serene with his charmingly sleepy presence.',
			'https://drive.google.com/file/d/1cZ2Qtq0OnH-6laF4M948Q7FN4NnFQxRp/view?usp=drive_link', false);

INSERT INTO pets(
	species, gender, age, name, breed, pet_size, color, description, profile_pic, is_adopted)
	VALUES ('Dog', 'Female', 3, 'Sasha', 'Pomeranian-Husky Mix', 'Large', 'Sable',
			'Meet your sassy and energetic dog who’s always ready for action! This lively dog thrives outdoors, reveling in every adventure and sniffing out new fun. With a love for delicious treats and a playful spirit, they’re a blast to have around, whether it’s playing with other pets or just goofing off in the backyard. Bursting with energy and personality, this dog will keep you on your toes and make every day exciting!',
			'https://drive.google.com/file/d/1InBCzlh6KZFb9MkiZSyPkJ-MNH9uYQqx/view?usp=drive_link', false);

INSERT INTO pets(
	species, gender, age, name, breed, pet_size, color, description, profile_pic, is_adopted)
	VALUES ('Cat', 'Male', 12, 'Spencer', 'American Ringtail', 'Medium', 'Grey Tabby',
			'Meet Spencer, the lovable grumpy old man with a heart of gold. He’s all about kicking back and soaking up the relaxation, preferring a cozy spot to unwind over any frenzied playtime. Spencer treasures quiet, one-on-one moments with his humans and thrives in a peaceful, single-pet home. If you’re looking for a chill companion who appreciates the finer things in life—like a good nap and gentle affection—Spencer is your perfect match.',
			'https://drive.google.com/file/d/18l5ceme2UCFfFdn6FAobxP2bRzMSgglp/view?usp=drive_link', false);

INSERT INTO pets(
	species, gender, age, name, breed, pet_size, color, description, profile_pic, is_adopted)
	VALUES ('Cat', 'Female', 8, 'Anju', 'Domestic Shorthair', 'Medium', 'Tuxedo',
			'Meet Anju, a sweet and serene lady who loves her peaceful alone time. This affectionate feline adores basking in sunny spots and enjoys the tranquility of her own space. She’s incredibly loving with her human and thrives in a single-pet home where she can be the center of attention. If you’re looking for a devoted companion who appreciates calm and cozy moments, Anju is the perfect match for you.',
			'https://drive.google.com/file/d/1bjbIQguYp-iM_wJUt7_iJUSWDkEAFQH5/view?usp=drive_link', false);

INSERT INTO pets(
	species, gender, age, name, breed, pet_size, color, description, profile_pic, is_adopted)
	VALUES ('Cat', 'Female', 8, 'Juniper', 'Unknown', 'Medium', 'Grey',
			'Meet Juniper, your chatty, sweet little companion with a big personality! This vocal furball loves to engage in lively conversations with her humans, always ready to share her thoughts. She’s a true foodie, delighting in every treat and meal, and she’s also a playful enthusiast when it comes to toys. Juniper’s charming mix of chatter, playfulness, and affection will keep you entertained and delighted every day!',
			'https://drive.google.com/file/d/1aaXE-bH69SVGPRdwKiwRS_vi8l7yRkVI/view?usp=drive_link', false);

COMMIT TRANSACTION;

--INSERT INTO users (email,password_hash,role, phone_number, date_of_birth, first_name, last_name) VALUES ('user@te.net','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER', '123-456-7890', '2024-08-04', 'Test', 'User');
--INSERT INTO users (email,password_hash,role, phone_number, date_of_birth, first_name, last_name) VALUES ('admin@te.net','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN', '123-456-7890', '2024-08-04', 'Test', 'Admin');
