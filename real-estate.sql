CREATE DATABASE `Real-estate`;

USE `Real-estate`;

CREATE TABLE `Customers` (
  `customer_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(50) NOT NULL,
  `last_name` VARCHAR(50) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `phone` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`customer_id`)
);

CREATE TABLE `Agents` (
  `agent_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(50) NOT NULL,
  `last_name` VARCHAR(50) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `phone` VARCHAR(20) NOT NULL,
  `commission_rate` DECIMAL(5,2) NOT NULL,
  PRIMARY KEY (`agent_id`)
);

CREATE TABLE `Orders` (
  `order_id` INT NOT NULL AUTO_INCREMENT,
  `customer_id` INT NOT NULL,
  `agent_id` INT NOT NULL,
  `property_id` INT NOT NULL,
  `order_date` DATE NOT NULL,
  `total_price` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`order_id`)
);

CREATE TABLE `Properties` (
  `property_id` INT NOT NULL AUTO_INCREMENT,
  `address` VARCHAR(200) NOT NULL,
  `bedrooms` INT NOT NULL,
  `bathrooms` INT NOT NULL,
  `square_footage` INT NOT NULL,
  `list_price` DECIMAL(10,2) NOT NULL,
  `seller_id` INT NOT NULL,
  PRIMARY KEY (`property_id`)
);

CREATE TABLE `Sellers` (
  `seller_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(50) NOT NULL,
  `last_name` VARCHAR(50) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `phone` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`seller_id`)
);

-- Generate 100 random customers
DELIMITER $$
CREATE PROCEDURE `populate_customers`(IN num_records INT)
BEGIN
    DECLARE i INT DEFAULT 0;
    WHILE i < num_records DO
        INSERT INTO `Customers` (`first_name`, `last_name`, `email`, `phone`)
        VALUES (CONCAT('Customer', i), 'LastName', CONCAT('customer', i, '@example.com'), CONCAT('123-456-', FLOOR(RAND()*10000)));
        SET i = i + 1;
    END WHILE;
END $$
DELIMITER ;

-- Call the procedure to insert 100 random customers
CALL `populate_customers`(100);

-- Generate 20 random agents
DELIMITER $$
CREATE PROCEDURE `populate_agents`(IN num_records INT)
BEGIN
    DECLARE i INT DEFAULT 0;
    WHILE i < num_records DO
        INSERT INTO `Agents` (`first_name`, `last_name`, `email`, `phone`, `commission_rate`)
        VALUES (CONCAT('Agent', i), 'LastName', CONCAT('agent', i, '@example.com'), CONCAT('123-456-', FLOOR(RAND()*10000)), ROUND(RAND()*10, 2));
        SET i = i + 1;
    END WHILE;
END $$
DELIMITER ;

-- Call the procedure to insert 20 random agents
CALL `populate_agents`(20);

-- Generate 10 random orders
DELIMITER $$
CREATE PROCEDURE `populate_orders`(IN num_records INT)
BEGIN
    DECLARE i INT DEFAULT 0;
    WHILE i < num_records DO
        INSERT INTO `Orders` (`property_id`, `customer_id`, `agent_id`, `order_date`, `total_price`)
        VALUES (FLOOR(RAND()*10)+1, FLOOR(RAND()*100)+1, FLOOR(RAND()*20)+1, DATE_SUB(NOW(), INTERVAL FLOOR(RAND()*30) DAY), FLOOR(RAND()*500000)+50000);
        SET i = i + 1;
    END WHILE;
END $$
DELIMITER ;

-- Call the procedure to insert 10 random orders
CALL `populate_orders`(10);

-- Generate 10 random properties
DELIMITER $$
CREATE PROCEDURE `populate_properties`(IN num_records INT)
BEGIN
    DECLARE i INT DEFAULT 0;
    WHILE i < num_records DO
        INSERT INTO `Properties` (`address`, `bedrooms`, `bathrooms`, `square_footage`, `list_price`, `seller_id`)
        VALUES (CONCAT(FLOOR(RAND()*1000)+1, ' Main St'), FLOOR(RAND()*5)+1, FLOOR(RAND()*3)+1, FLOOR(RAND()*3000)+500, FLOOR(RAND()*500000)+50000, FLOOR(RAND()*20)+1);
        SET i = i + 1;
    END WHILE;
END $$
DELIMITER ;

-- Call the procedure to insert 10 random properties
CALL `populate_properties`(10);

-- Generate 10 random sellers
DELIMITER $$
CREATE PROCEDURE `populate_sellers`(IN num_records INT)
BEGIN
    DECLARE i INT DEFAULT 0;
    WHILE i < num_records DO
        INSERT INTO `sellers` (`first_name`, `last_name`, `email`, `phone`)
        VALUES (CONCAT('First', FLOOR(RAND()*100)+1), CONCAT('Last', FLOOR(RAND()*100)+1), CONCAT('seller', FLOOR(RAND()*100)+1, '@example.com'), CONCAT('555-555-', FLOOR(RAND()*10000)+1));
        SET i = i + 1;
    END WHILE;
END $$
DELIMITER ;

-- Call the procedure to insert 10 random sellers
CALL `populate_sellers`(10);
