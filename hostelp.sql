-- 1️⃣ Create the database
CREATE DATABASE IF NOT EXISTS hostelp;

-- 2️⃣ Use the database
USE hostelp;

-- 3️⃣ Create users table
DROP TABLE IF EXISTS users;

CREATE TABLE users (
    id CHAR(36) PRIMARY KEY DEFAULT (UUID()),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    name TEXT,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone_number VARCHAR(20)
);

-- 4️⃣ Create complaints table
DROP TABLE IF EXISTS complaints;

CREATE TABLE complaints (
    id CHAR(36) PRIMARY KEY DEFAULT (UUID()),
    user_id CHAR(36) NOT NULL,
    title VARCHAR(255),
    description TEXT,
    category VARCHAR(50),
    priority ENUM('Low','Medium','High'),
    image LONGTEXT,
    status ENUM('Open','In Progress','Resolved') DEFAULT 'Open',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);
