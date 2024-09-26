-- Seleccionamos el esquema de la base de datos gamesdb
USE gamesdb;

-- Insertamos los datos a las tablas
INSERT INTO users (UserName, UserPassword, Email)
VALUES
    ('playerOne', 'password123', 'player1@example.com'),
    ('playerTwo', 'password456', 'player2@example.com'),
    ('playerThree', 'password789', 'player3@example.com'),
    ('playerFour', 'password987', 'player4@example.comm'),
    ('playerFive', 'password876', 'player5@example.com');
    
INSERT INTO characters (UserId, CharacterName, CharacterCoords, CharacterInventory, CharacterLevel)
VALUES
    (1, 'WarriorX', '123,456', 'Sword, Shield', 100),
    (1, 'MageOfLight', '321,654', 'Staff, Potion', 85),
    (2, 'NinjaStorm', '111,222', 'Katana, Stars', 50),
    (3, 'PaladinKing', '777,999', 'Hammer, Armor', 100),
    (4, 'RogueRaven', '555,888', 'Dagger, Cloak', 70),
    (5, 'FireWizard', '333,666', 'FireStaff, SpellBook', 100);

INSERT INTO items (ItemName, ItemDescription)
VALUES
    ('Sword', 'A sharp blade for close combat'),
    ('Shield', 'A sturdy shield to block attacks'),
    ('Potion', 'Heals health when used'),
    ('Katana', 'A swift blade from the East'),
    ('FireStaff', 'A magical staff that casts fire spells');

INSERT INTO stores (ItemId, StoreName, GoldPrice, Quantity)
VALUES
    (1, 'Blaine', 100, 10),
    (2, 'Blaine', 200, 5),
    (3, 'MagicShop', 50, 20),
    (4, 'NinjaShop', 150, 7),
    (5, 'MagicShop', 300, 3);