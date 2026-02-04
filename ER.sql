-- Create the Gym table
CREATE TABLE IF NOT EXISTS Gym (
    gym_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(255) NOT NULL,
    phone_number VARCHAR(20) NOT NULL
);

-- Create the Member table
CREATE TABLE IF NOT EXISTS Member (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    last_name VARCHAR(50) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    address VARCHAR(255) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender VARCHAR(10) NOT NULL,
    gym_id INT,
    FOREIGN KEY (gym_id) REFERENCES Gym(gym_id)
);

-- Create the Coach table
CREATE TABLE IF NOT EXISTS Coach (
    coach_id INT AUTO_INCREMENT PRIMARY KEY,
    last_name VARCHAR(50) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    age INT NOT NULL,
    specialty VARCHAR(100) NOT NULL
);

-- Create the Session table
CREATE TABLE IF NOT EXISTS Session (
    session_id INT AUTO_INCREMENT PRIMARY KEY,
    sport_type VARCHAR(100) NOT NULL,
    schedule DATETIME NOT NULL,
    max_capacity INT DEFAULT 20,
    gym_id INT,
    FOREIGN KEY (gym_id) REFERENCES Gym(gym_id)
);

-- Create the Session_Coaches junction table
CREATE TABLE IF NOT EXISTS Session_Coaches (
    session_id INT,
    coach_id INT,
    PRIMARY KEY (session_id, coach_id),
    FOREIGN KEY (session_id) REFERENCES Session(session_id),
    FOREIGN KEY (coach_id) REFERENCES Coach(coach_id)
);

-- Create the Registration junction table
CREATE TABLE IF NOT EXISTS Registration (
    registration_id INT AUTO_INCREMENT PRIMARY KEY,
    member_id INT,
    session_id INT,
    FOREIGN KEY (member_id) REFERENCES Member(member_id),
    FOREIGN KEY (session_id) REFERENCES Session(session_id)
);
