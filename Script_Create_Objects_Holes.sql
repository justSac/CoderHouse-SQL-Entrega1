-- Creamos la base de datos del videojuego
DROP SCHEMA IF EXISTS gamesdb;
CREATE SCHEMA IF NOT EXISTS gamesdb;

-- Seleccionamos el esquema gamesdb
USE gamesdb;

-- Creamos las tablas
DROP TABLE IF EXISTS users;
CREATE TABLE users (
    UserId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    UserName VARCHAR(25) NOT NULL,
    UserPassword VARCHAR(50) NOT NULL,
    Email VARCHAR(50)
);

DROP TABLE IF EXISTS characters;
CREATE TABLE characters (
    CharacterId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    UserId INT NOT NULL,
    CharacterName VARCHAR(13) NOT NULL UNIQUE,
    CharacterCoords VARCHAR(20) NOT NULL,
    CharacterInventory VARCHAR(50) NOT NULL,
    CharacterLevel INT NOT NULL,
    FOREIGN KEY (UserId) REFERENCES users(UserId) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS items;
CREATE TABLE items (
    ItemId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ItemName VARCHAR(50) NOT NULL,
    ItemDescription VARCHAR(200) NOT NULL
);

DROP TABLE IF EXISTS stores;
CREATE TABLE stores (
    StoreId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ItemId INT NOT NULL,
    StoreName VARCHAR(15) NOT NULL UNIQUE,
    GoldPrice INT NOT NULL,
    Quantity INT NOT NULL,
    FOREIGN KEY (ItemId) REFERENCES items(ItemId) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS character_items;
CREATE TABLE character_items (
    CharacterId INT NOT NULL,
    ItemId INT NOT NULL,
    ItemQuantity INT NOT NULL,
    FOREIGN KEY (CharacterId) REFERENCES characters(CharacterId) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (ItemId) REFERENCES items(ItemId) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (CharacterId, ItemId)
);

-- Mostramos una vista de todos los usuarios con nivel 100 mediante un JOIN
CREATE OR REPLACE VIEW vs_users_characters AS
SELECT u.UserName, c.CharacterName, c.CharacterLevel, i.ItemName 
FROM users u
JOIN characters c ON u.UserId = c.UserId
LEFT JOIN character_items ci ON c.CharacterId = ci.CharacterId
LEFT JOIN items i ON ci.ItemId = i.ItemId
WHERE c.CharacterLevel = 100;

-- Mostramos una vista de todos los items en donde la tienda sea la de Blaine
CREATE OR REPLACE VIEW vs_store_blaine AS
    SELECT ItemId, StoreName, GoldPrice, Quantity 
    FROM stores
    WHERE StoreName = 'Blaine';

DELIMITER $$

-- Función que cuenta la cantidad de personajes creados por un usuario
CREATE FUNCTION count_user_characters(UserId INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE character_count INT;
    
    SELECT COUNT(*) INTO character_count
    FROM characters
    WHERE UserId = UserId;

    RETURN character_count;
END $$

DELIMITER ;
