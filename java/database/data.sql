BEGIN TRANSACTION;

INSERT INTO users (username,password_hash,role,changed_password) VALUES ('user@te.net','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER', true);
INSERT INTO users (username,password_hash,role,changed_password) VALUES ('admin@te.net','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN', true);

INSERT INTO pets(
	species, gender, age, name, breed, pet_size, color, description, profile_pic, is_adopted)
	VALUES ('Dog', 'Female', 2, 'Scarlet', 'Aussiedoodle Mini', 'Small', 'Gray, Tan, Black',
	'Always full of energy and ready to take on any play time you have for her. She is very lovely and is always waiting to see her favorite people and wanting attention from them. She can be a little on the noisy side when it comes to barking.',
			'https://res.cloudinary.com/ddqchrxtm/image/upload/v1722969083/Scarlet-Dog_zganlm.jpg', false);

INSERT INTO pets(
	species, gender, age, name, breed, pet_size, color, description, profile_pic, is_adopted)
	VALUES ('Dog', 'Female', 12, 'Maggie', 'Boxer', 'Medium', 'Brown, White',
	'She is always wanting to be with her person. She is very cuddly and full of love. Her nickname is wiggle butts since she is always wiggling when she is excited. She can be a little on the loud side when barking.',
			'https://res.cloudinary.com/ddqchrxtm/image/upload/v1722969504/Maggie-Dog_iyg0ic.jpg', false);

INSERT INTO pets(
	species, gender, age, name, breed, pet_size, color, description, profile_pic, is_adopted)
	VALUES ('Dog', 'Male', 2, 'Gus', 'Great Dane', 'X-Large', 'White, Black',
	'Gus is always looking for someone to give him attention. He loves the feeling of someone petting him and showing him love. He will always be by your side, sometimes a little too much. He is a real couch potato getting small short bursts of energy throughout the day. When it comes to barking, it is only to alert his family of possible danger.',
			'https://res.cloudinary.com/dtennawyr/image/upload/v1723052943/Gus-Dog_ga7neg.jpg', false);

INSERT INTO pets(
	species, gender, age, name, breed, pet_size, color, description, profile_pic, is_adopted)
	VALUES ('Dog', 'Female', 12, 'Demi', 'Afghan Hound',
	'Large', 'Cream', 'If you are looking for a nice calm couch potato companion, look no further. Demi is a very chill and laid back dog. She doesn’t have much energy to play, she is more into laying down and chilling out all day. She doesn’t move around much so she is good in small places. In terms of barking, she hardly ever barks, some don’t even know if she can bark.',
			'https://res.cloudinary.com/ddqchrxtm/image/upload/v1722969469/Demi-Dog_zqv8ex.jpg', false);

INSERT INTO pets(
	species, gender, age, name, breed, pet_size, color, description, profile_pic, is_adopted)
	VALUES ('Dog', 'Female', 1, 'Bynx', 'Great Dane', 'X-Large', 'Blue',
			'Bynx is still a young puppy when making this listing. Since she is still a puppy, she isn’t fully house trained and still learning. If you take this beautiful puppy home, you’ll get the full experience of raising your own puppy. She is big for her age, so expect a huge Great Dane when she is fully grown. She is still very energetic and full of curiosity during this phase of her life. In terms of her barking, she doesn’t bark much except to alert her family of possible danger.',
			'https://res.cloudinary.com/ddqchrxtm/image/upload/v1722969486/Bynx-Dog_p0alu6.jpg', false);

INSERT INTO pets(
	species, gender, age, name, breed, pet_size, color, description, profile_pic, is_adopted)
	VALUES ('Dog', 'Male', 3, 'Benji', 'Golden Doodle Mini', 'Medium', 'Golden, Tan',
			'Benji is a bundle of joy with a heart as big as his playful spirit. Always smiling and wagging his tail, he’s known for his enthusiastic greetings and kisses. This lovable goofball has an odd habit of munching on rocks but don’t let that distract you from his true talent; snuggling up and binge watching movies with anyone who needs a cozy companion. If you’re looking for a fun loving sidekick, Benji’s your guy!',
			'https://res.cloudinary.com/ddqchrxtm/image/upload/v1722966959/Benji-Dog_yly8zf.png', false);

INSERT INTO pets(
	species, gender, age, name, breed, pet_size, color, description, profile_pic, is_adopted)
	VALUES ('Cat', 'Male', 2, 'Cinnamon', 'Bengal', 'Medium', 'Orange',
			'Cinnamon is the ultimate furry friend, bursting with loyalty and love. After a rough start on the streets, he bounced back with a heart full of excitement and gratitude. Cinnamon’s always up for cuddles, can’t get enough of bubble baths, and is your go to buddy for fun outings. This lovable kitty will never leave your side and always knows the way back home. Ready for adventure? Cinnamon’s your perfect partner!',
			'https://res.cloudinary.com/dtennawyr/image/upload/v1723052942/Cinnamon_Cat_liotka.png', false);

INSERT INTO pets(
	species, gender, age, name, breed, pet_size, color, description, profile_pic, is_adopted)
	VALUES ('Cat', 'Female', 8, 'Maya', 'Short Hair Tabby', 'Large', 'Gray, Orange',
			'Maya is the ultimate cuddle buddy. This sweet furball is always ready to curl up on your bed and purr her way into your heart. If you try to brush her off, be prepared for some heavy back talk. Maya is not just a loving companion; she’s also the best listener, always there to hear you out and snuggle up for those late-night chats. When it comes to sleepovers, Maya is your perfect partner!',
			'https://res.cloudinary.com/dtennawyr/image/upload/v1723052942/Maya_Cat_feetwu.jpg', false);

INSERT INTO pets(
	species, gender, age, name, breed, pet_size, color, description, profile_pic, is_adopted)
	VALUES ('Cat', 'Male', 8, 'Tiger', 'Short Hair Tabby', 'Medium', 'Gray',
			'Tiger might be the quiet type, but he’s got a heart full of charm! He’s a master at staking out his favorite spot and sticking to it like a true king. Leave a door open, and he’ll pounce through with the grace of a feline ninja, his curiosity always leading the way. While he might get a bit jumpy at surprises, Tiger’s dedication to guarding his territory—and you—is unwavering. He’s your loyal little protector, making sure that no one, or anything, disturbs his cozy domain!',
			'https://res.cloudinary.com/dtennawyr/image/upload/v1723052942/Tiger_Cat_lkweue.jpg', false);

INSERT INTO pets(
	species, gender, age, name, breed, pet_size, color, description, profile_pic, is_adopted)
	VALUES ('Cat', 'Male', 8, 'Kabuto', 'Domestic Shorthair', 'Medium', 'Tuxedo',
			'Meet Kabuto, the ultimate socialite of the cat world! This friendly feline thrives on human interaction, always eager to chat and be the center of attention. Kabuto’s love for conversation is matched only by his enthusiasm for food—he’s a true gourmand who’ll happily join you at mealtime and offer his purrs of approval. With Kabuto around, you can count on endless cuddles, playful banter, and a constant reminder of just how delightful life can be with a loving, food-loving furball by your side.',
			'https://res.cloudinary.com/ddqchrxtm/image/upload/v1722966930/Cat_cipmxz.jpg', false);

INSERT INTO pets(
	species, gender, age, name, breed, pet_size, color, description, profile_pic, is_adopted)
	VALUES ('Cat', 'Male', 2, 'Lucifer', 'Domestic Longhair', 'Medium', 'Black',
			'Meet Lucifer, the playful night owl of the cat world! This energetic furball is full of mischief and fun, especially when the moon is out. By day, he’s all about finding the coziest, darkest spots for his beauty sleep. But as soon as night falls, he’s on the prowl for toys and adventures. With Lucifer around, your nights will be lively and full of feline antics, while your days are perfectly serene with his charmingly sleepy presence.',
			'https://res.cloudinary.com/ddqchrxtm/image/upload/v1722969495/Lucifer_Cat_tstutt.jpg', false);

INSERT INTO pets(
	species, gender, age, name, breed, pet_size, color, description, profile_pic, is_adopted)
	VALUES ('Dog', 'Female', 3, 'Sasha', 'Pomeranian-Husky Mix', 'Large', 'Sable',
			'Meet your sassy and energetic dog who’s always ready for action! This lively dog thrives outdoors, reveling in every adventure and sniffing out new fun. With a love for delicious treats and a playful spirit, they’re a blast to have around, whether it’s playing with other pets or just goofing off in the backyard. Bursting with energy and personality, this dog will keep you on your toes and make every day exciting!',
			'https://res.cloudinary.com/ddqchrxtm/image/upload/v1722969239/Sasha_Dog_l5purp.jpg', false);

INSERT INTO pets(
	species, gender, age, name, breed, pet_size, color, description, profile_pic, is_adopted)
	VALUES ('Cat', 'Male', 12, 'Spencer', 'American Ringtail', 'Medium', 'Grey Tabby',
			'Meet Spencer, the lovable grumpy old man with a heart of gold. He’s all about kicking back and soaking up the relaxation, preferring a cozy spot to unwind over any frenzied playtime. Spencer treasures quiet, one-on-one moments with his humans and thrives in a peaceful, single-pet home. If you’re looking for a chill companion who appreciates the finer things in life—like a good nap and gentle affection—Spencer is your perfect match.',
			'https://res.cloudinary.com/dtennawyr/image/upload/v1723052942/Spencer_Cat_raqoth.jpg', false);

INSERT INTO pets(
	species, gender, age, name, breed, pet_size, color, description, profile_pic, is_adopted)
	VALUES ('Cat', 'Female', 8, 'Anju', 'Domestic Shorthair', 'Medium', 'Tuxedo',
			'Meet Anju, a sweet and serene lady who loves her peaceful alone time. This affectionate feline adores basking in sunny spots and enjoys the tranquility of her own space. She’s incredibly loving with her human and thrives in a single-pet home where she can be the center of attention. If you’re looking for a devoted companion who appreciates calm and cozy moments, Anju is the perfect match for you.',
			'https://res.cloudinary.com/ddqchrxtm/image/upload/v1722969479/Anju_Cat_lj8gx9.jpg', false);

INSERT INTO pets(
	species, gender, age, name, breed, pet_size, color, description, profile_pic, is_adopted)
	VALUES ('Cat', 'Female', 8, 'Juniper', 'Unknown', 'Medium', 'Grey',
			'Meet Juniper, your chatty, sweet little companion with a big personality! This vocal furball loves to engage in lively conversations with her humans, always ready to share her thoughts. She’s a true foodie, delighting in every treat and meal, and she’s also a playful enthusiast when it comes to toys. Juniper’s charming mix of chatter, playfulness, and affection will keep you entertained and delighted every day!',
			'https://res.cloudinary.com/dtennawyr/image/upload/v1723052942/Juniper_Cat_ez6iyp.jpg', false);

INSERT INTO pets(
	species, gender, age, name, breed, pet_size, color, description, profile_pic, is_adopted)
	VALUES ('Dog', 'male', 2, 'JoJo', 'Labrador Retriever', 'Medium', 'Gold',
			'Jojo is a playful and affectionate dog with a heart full of love and energy. This charming companion has a shiny, sleek coat and sparkling eyes that reflect a zest for life. Whether he’s chasing his favorite toy, cuddling up for some cozy snuggles, or greeting you with an enthusiastic wag of his tail, Jojo brings joy and warmth wherever he goes. His friendly nature makes him a perfect friend for both children and adults, and his boundless curiosity ensures that every day is an adventure. With Jojo by your side, you’ll always have a loyal and loving buddy to share life’s moments with.',
			'https://res.cloudinary.com/ddqchrxtm/image/upload/v1723648627/Dog_rqiid3_Square_jwdpzf.jpg', false);

INSERT INTO pets(
	species, gender, age, name, breed, pet_size, color, description, profile_pic, is_adopted)
	VALUES ('Cat', 'female', 9, 'Molly', 'Calico', 'Small', 'Black, White, Orange',
			'Molly is a graceful and enchanting feline with a coat as soft as a cloud and eyes that shine with curiosity. She moves with a gentle elegance, often found lounging in sunlit spots or playfully pouncing on her favorite toys. With a serene demeanor and a penchant for cuddling, Molly is the perfect companion for quiet evenings and cozy moments. Her affectionate purrs and delicate headbutts are her way of showing love and appreciation. Whether she’s watching the world from a windowsill or curling up beside you, Molly adds a touch of warmth and charm to every day.',
			'https://res.cloudinary.com/ddqchrxtm/image/upload/v1723648622/Molly_cat_qweas1.jpg', false);

INSERT INTO pets(
	species, gender, age, name, breed, pet_size, color, description, profile_pic, is_adopted)
	VALUES ('Cat', 'female', 5, 'Elixir', 'Unknown', 'Small', 'Black',
			'Exiler is a striking and mysterious cat with an air of intrigue and elegance. With a sleek, glossy coat and piercing eyes, Exiler commands attention and curiosity. This feline has a bold and independent spirit, often found exploring new nooks or observing the world from a high perch. Despite his enigmatic demeanor, Exiler has a soft spot for moments of quiet companionship and gentle affection. His unique personality and captivating presence make him a standout companion, bringing a touch of adventure and sophistication to every day.',
			'https://res.cloudinary.com/ddqchrxtm/image/upload/v1723648623/Elixir_cat_susyww.jpg', false);

INSERT INTO pets(
	species, gender, age, name, breed, pet_size, color, description, profile_pic, is_adopted)
	VALUES ('Cat', 'Female', 8, 'Persephone', 'Sphnyx', 'Medium', 'Gray',
			'Persephone is a stunning hairless cat with a sleek, smooth, and velvety skin that’s as soft as silk. Her elegant, refined appearance is complemented by large, expressive eyes that reveal her curious and playful nature. Despite her lack of fur, Persephone radiates warmth and affection, often curling up close to enjoy the coziness of a warm lap or sunlit spot. With a gentle and charming personality, she loves to be the center of attention, offering sweet purrs and delightful companionship. Persephone’s unique and graceful presence makes her an unforgettable and cherished friend.',
			'https://res.cloudinary.com/ddqchrxtm/image/upload/v1723648625/Persephone_cat_zeazzt.jpg', false);

INSERT INTO pets(
	species, gender, age, name, breed, pet_size, color, description, profile_pic, is_adopted)
	VALUES ('Dog', 'Male', 14, 'Aiden', 'beagle', 'Small', 'White, Black, Brown',
			'Aiden is a lovable and spirited dog with a heart full of enthusiasm and joy. His warm, expressive eyes and wagging tail make every interaction a delight. Whether he’s bounding through the park, playing fetch, or snuggling up beside you on the couch, Aiden’s infectious energy and affectionate nature shine through. He’s such a good dog, always eager to please and bring a smile to your face. With his friendly demeanor and unwavering loyalty, Aiden is the perfect companion for adventures and quiet moments alike.',
			'https://res.cloudinary.com/ddqchrxtm/image/upload/v1723648766/AidenDog_1_fzyglq.png', false);

INSERT INTO registration(email, phone_number, date_of_birth, first_name, last_name)
VALUES ('jd@te.net', '444-555-7777', '2004-01-01', 'John', 'Douglas');

COMMIT TRANSACTION;

--INSERT INTO users (email,password_hash,role, phone_number, date_of_birth, first_name, last_name) VALUES ('user@te.net','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER', '123-456-7890', '2024-08-04', 'Test', 'User');
--INSERT INTO users (email,password_hash,role, phone_number, date_of_birth, first_name, last_name) VALUES ('admin@te.net','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN', '123-456-7890', '2024-08-04', 'Test', 'Admin');
