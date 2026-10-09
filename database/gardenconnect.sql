CREATE DATABASE IF NOT EXISTS gardenconnect;
USE gardenconnect;

CREATE TABLE IF NOT EXISTS users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    password_hash VARCHAR(64) NOT NULL,
    role VARCHAR(20) NOT NULL DEFAULT 'GARDENER',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS posts (
    post_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    title VARCHAR(200) NOT NULL,
    content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS comments (
    comment_id INT PRIMARY KEY AUTO_INCREMENT,
    post_id INT NOT NULL,
    user_id INT NOT NULL,
    comment TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (post_id) REFERENCES posts(post_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS post_likes (
    post_id INT NOT NULL,
    user_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (post_id, user_id),
    FOREIGN KEY (post_id) REFERENCES posts(post_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS plants (
    plant_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(120) NOT NULL,
    type VARCHAR(80) NOT NULL,
    sunlight VARCHAR(80) NOT NULL,
    watering_frequency VARCHAR(80) NOT NULL,
    description TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS user_plants (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    plant_id INT NOT NULL,
    planted_date DATE NOT NULL,
    last_watered DATE NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (plant_id) REFERENCES plants(plant_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS questions (
    question_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    title VARCHAR(200) NOT NULL,
    description TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS answers (
    answer_id INT PRIMARY KEY AUTO_INCREMENT,
    question_id INT NOT NULL,
    user_id INT NOT NULL,
    answer TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (question_id) REFERENCES questions(question_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS notifications (
    notification_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    message VARCHAR(255) NOT NULL,
    is_read BOOLEAN NOT NULL DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

INSERT INTO plants (name, type, sunlight, watering_frequency, description)
SELECT 'Aloe Vera','Succulent','Bright indirect','Every 7-10 days','Low-maintenance succulent with medicinal uses.'
WHERE NOT EXISTS (SELECT 1 FROM plants WHERE name='Aloe Vera');
INSERT INTO plants (name, type, sunlight, watering_frequency, description)
SELECT 'Tulsi','Herb','4-6 hours','Every 1-2 days','Aromatic herb commonly grown in Indian homes.'
WHERE NOT EXISTS (SELECT 1 FROM plants WHERE name='Tulsi');
INSERT INTO plants (name, type, sunlight, watering_frequency, description)
SELECT 'Money Plant','Indoor Vine','Indirect','Every 5-7 days','Popular indoor plant that grows well in indirect light.'
WHERE NOT EXISTS (SELECT 1 FROM plants WHERE name='Money Plant');
INSERT INTO plants (name, type, sunlight, watering_frequency, description)
SELECT 'Rose','Flowering Plant','6+ hours','Every 2-3 days','Flowering plant needing good sunlight and regular care.'
WHERE NOT EXISTS (SELECT 1 FROM plants WHERE name='Rose');
INSERT INTO plants (name, type, sunlight, watering_frequency, description)
SELECT 'Mint','Herb','4-6 hours','Every 1-2 days','Fast-growing herb that prefers consistently moist soil.'
WHERE NOT EXISTS (SELECT 1 FROM plants WHERE name='Mint');
INSERT INTO plants (name, type, sunlight, watering_frequency, description)
SELECT 'Snake Plant','Indoor Plant','Low to bright indirect','Every 10-14 days','Hardy indoor plant tolerant of low light.'
WHERE NOT EXISTS (SELECT 1 FROM plants WHERE name='Snake Plant');
