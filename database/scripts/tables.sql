CREATE DATABASE obfuscator_demo;

USE obfuscator_demo;

CREATE TABLE Company
(
    id         INT PRIMARY KEY AUTO_INCREMENT,
    name       VARCHAR(255),
    street     VARCHAR(255),
    zipcode    VARCHAR(20),
    city       VARCHAR(100),
    country    VARCHAR(3),
    phone      VARCHAR(20),
    fax        VARCHAR(20),
    website    VARCHAR(255),
    email      VARCHAR(255),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE User
(
    id         INT PRIMARY KEY AUTO_INCREMENT,
    name       VARCHAR(100) UNIQUE,
    surname    VARCHAR(100) UNIQUE,
    street     VARCHAR(255),
    zipcode    VARCHAR(20),
    city       VARCHAR(100),
    county     VARCHAR(100),
    country    VARCHAR(3),
    phone      VARCHAR(20),
    mobile     VARCHAR(20),
    fax        VARCHAR(20),
    website    VARCHAR(255),
    language   VARCHAR(10),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE Login
(
    id         INT PRIMARY KEY AUTO_INCREMENT,
    login      VARCHAR(100) UNIQUE,
    password   VARCHAR(255),
    email      VARCHAR(100) UNIQUE,
    user_id    INT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES User (id)
);

-- Weitere Tabellen erstellen


-- Tabelle Payment erstellen
CREATE TABLE Payment
(
    id             INT PRIMARY KEY AUTO_INCREMENT,
    type           INT,          -- Debit, Creditcard, SEPA, Klarna, Paypal
    user_id        INT,
    card_number    BIGINT,       -- Nummer der Kreditkarte
    account_holder VARCHAR(255), -- Name auf der Karte
    cvv            INT,          -- Checksum
    valid_until    DATETIME,     -- Ablaufdatum
    provider       VARCHAR(50),  -- amex, visa, mastercard
    iban           VARCHAR(34),  -- IBAN
    bic            VARCHAR(11),  -- BIC
    blz            VARCHAR(8),   -- BLZ
    account        BIGINT,       -- Kontonummer
    created_at     DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at     DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES User (id)
);

-- Tabelle Payment_Transactions erstellen
CREATE TABLE Payment_Transactions
(
    id             INT PRIMARY KEY AUTO_INCREMENT,
    user_id        INT,
    payment_id     INT,
    type           INT,          -- Debit, Creditcard, SEPA, Klarna, Paypal
    transaction_id VARCHAR(255), -- from Payment Provider
    payment_data   JSON,         -- all Data as actual Snapshot
    created_at     DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at     DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES User (id),
    FOREIGN KEY (payment_id) REFERENCES Payment (id)
);
