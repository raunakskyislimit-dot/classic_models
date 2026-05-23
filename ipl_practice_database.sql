-- IPL Practice Database
-- Compatible with MySQL 8+
-- Dataset purpose: SQL practice with real IPL team/player/venue names and realistic sample match data.
-- Note: This is a practice dataset, not an official complete IPL historical database.

DROP DATABASE IF EXISTS ipl_practice_db;
CREATE DATABASE ipl_practice_db;
USE ipl_practice_db;

-- =========================
-- 1. TEAMS TABLE
-- =========================
CREATE TABLE teams (
    team_id INT PRIMARY KEY,
    team_name VARCHAR(100) NOT NULL,
    short_name VARCHAR(10) NOT NULL,
    home_city VARCHAR(50),
    founded_year INT
);

INSERT INTO teams (team_id, team_name, short_name, home_city, founded_year) VALUES
(1, 'Chennai Super Kings', 'CSK', 'Chennai', 2008),
(2, 'Mumbai Indians', 'MI', 'Mumbai', 2008),
(3, 'Royal Challengers Bengaluru', 'RCB', 'Bengaluru', 2008),
(4, 'Kolkata Knight Riders', 'KKR', 'Kolkata', 2008),
(5, 'Delhi Capitals', 'DC', 'Delhi', 2008),
(6, 'Rajasthan Royals', 'RR', 'Jaipur', 2008),
(7, 'Sunrisers Hyderabad', 'SRH', 'Hyderabad', 2013),
(8, 'Punjab Kings', 'PBKS', 'Mohali', 2008),
(9, 'Gujarat Titans', 'GT', 'Ahmedabad', 2022),
(10, 'Lucknow Super Giants', 'LSG', 'Lucknow', 2022);

-- =========================
-- 2. VENUES TABLE
-- =========================
CREATE TABLE venues (
    venue_id INT PRIMARY KEY,
    venue_name VARCHAR(150) NOT NULL,
    city VARCHAR(60) NOT NULL,
    capacity INT
);

INSERT INTO venues (venue_id, venue_name, city, capacity) VALUES
(1, 'M. A. Chidambaram Stadium', 'Chennai', 38000),
(2, 'Wankhede Stadium', 'Mumbai', 33108),
(3, 'M. Chinnaswamy Stadium', 'Bengaluru', 40000),
(4, 'Eden Gardens', 'Kolkata', 68000),
(5, 'Arun Jaitley Stadium', 'Delhi', 41842),
(6, 'Sawai Mansingh Stadium', 'Jaipur', 30000),
(7, 'Rajiv Gandhi International Stadium', 'Hyderabad', 55000),
(8, 'PCA IS Bindra Stadium', 'Mohali', 27000),
(9, 'Narendra Modi Stadium', 'Ahmedabad', 132000),
(10, 'BRSABV Ekana Cricket Stadium', 'Lucknow', 50000),
(11, 'DY Patil Stadium', 'Navi Mumbai', 55000),
(12, 'MCA Stadium', 'Pune', 37000);

-- =========================
-- 3. PLAYERS TABLE
-- =========================
CREATE TABLE players (
    player_id INT PRIMARY KEY,
    player_name VARCHAR(100) NOT NULL,
    role VARCHAR(30),
    batting_style VARCHAR(50),
    bowling_style VARCHAR(50),
    nationality VARCHAR(50),
    team_id INT,
    FOREIGN KEY (team_id) REFERENCES teams(team_id)
);

INSERT INTO players (player_id, player_name, role, batting_style, bowling_style, nationality, team_id) VALUES
(1, 'MS Dhoni', 'Wicketkeeper', 'Right-hand bat', NULL, 'India', 1),
(2, 'Ruturaj Gaikwad', 'Batter', 'Right-hand bat', NULL, 'India', 1),
(3, 'Ravindra Jadeja', 'All-rounder', 'Left-hand bat', 'Left-arm orthodox', 'India', 1),
(4, 'Deepak Chahar', 'Bowler', 'Right-hand bat', 'Right-arm medium', 'India', 1),
(5, 'Shivam Dube', 'All-rounder', 'Left-hand bat', 'Right-arm medium', 'India', 1),

(6, 'Rohit Sharma', 'Batter', 'Right-hand bat', NULL, 'India', 2),
(7, 'Suryakumar Yadav', 'Batter', 'Right-hand bat', NULL, 'India', 2),
(8, 'Hardik Pandya', 'All-rounder', 'Right-hand bat', 'Right-arm medium', 'India', 2),
(9, 'Jasprit Bumrah', 'Bowler', 'Right-hand bat', 'Right-arm fast', 'India', 2),
(10, 'Ishan Kishan', 'Wicketkeeper', 'Left-hand bat', NULL, 'India', 2),

(11, 'Virat Kohli', 'Batter', 'Right-hand bat', 'Right-arm medium', 'India', 3),
(12, 'Faf du Plessis', 'Batter', 'Right-hand bat', 'Legbreak', 'South Africa', 3),
(13, 'Glenn Maxwell', 'All-rounder', 'Right-hand bat', 'Offbreak', 'Australia', 3),
(14, 'Mohammed Siraj', 'Bowler', 'Right-hand bat', 'Right-arm fast', 'India', 3),
(15, 'Dinesh Karthik', 'Wicketkeeper', 'Right-hand bat', NULL, 'India', 3),

(16, 'Shreyas Iyer', 'Batter', 'Right-hand bat', 'Legbreak', 'India', 4),
(17, 'Andre Russell', 'All-rounder', 'Right-hand bat', 'Right-arm fast', 'West Indies', 4),
(18, 'Sunil Narine', 'All-rounder', 'Left-hand bat', 'Offbreak', 'West Indies', 4),
(19, 'Rinku Singh', 'Batter', 'Left-hand bat', NULL, 'India', 4),
(20, 'Varun Chakravarthy', 'Bowler', 'Right-hand bat', 'Legbreak googly', 'India', 4),

(21, 'Rishabh Pant', 'Wicketkeeper', 'Left-hand bat', NULL, 'India', 5),
(22, 'David Warner', 'Batter', 'Left-hand bat', 'Legbreak', 'Australia', 5),
(23, 'Axar Patel', 'All-rounder', 'Left-hand bat', 'Left-arm orthodox', 'India', 5),
(24, 'Kuldeep Yadav', 'Bowler', 'Left-hand bat', 'Left-arm wrist spin', 'India', 5),
(25, 'Prithvi Shaw', 'Batter', 'Right-hand bat', NULL, 'India', 5),

(26, 'Sanju Samson', 'Wicketkeeper', 'Right-hand bat', NULL, 'India', 6),
(27, 'Jos Buttler', 'Wicketkeeper', 'Right-hand bat', NULL, 'England', 6),
(28, 'Yashasvi Jaiswal', 'Batter', 'Left-hand bat', 'Legbreak', 'India', 6),
(29, 'Yuzvendra Chahal', 'Bowler', 'Right-hand bat', 'Legbreak', 'India', 6),
(30, 'Riyan Parag', 'All-rounder', 'Right-hand bat', 'Legbreak', 'India', 6),

(31, 'Pat Cummins', 'Bowler', 'Right-hand bat', 'Right-arm fast', 'Australia', 7),
(32, 'Aiden Markram', 'Batter', 'Right-hand bat', 'Offbreak', 'South Africa', 7),
(33, 'Heinrich Klaasen', 'Wicketkeeper', 'Right-hand bat', NULL, 'South Africa', 7),
(34, 'Bhuvneshwar Kumar', 'Bowler', 'Right-hand bat', 'Right-arm medium', 'India', 7),
(35, 'Abhishek Sharma', 'All-rounder', 'Left-hand bat', 'Left-arm orthodox', 'India', 7),

(36, 'Shikhar Dhawan', 'Batter', 'Left-hand bat', 'Offbreak', 'India', 8),
(37, 'Sam Curran', 'All-rounder', 'Left-hand bat', 'Left-arm medium', 'England', 8),
(38, 'Arshdeep Singh', 'Bowler', 'Left-hand bat', 'Left-arm medium', 'India', 8),
(39, 'Kagiso Rabada', 'Bowler', 'Left-hand bat', 'Right-arm fast', 'South Africa', 8),
(40, 'Jitesh Sharma', 'Wicketkeeper', 'Right-hand bat', NULL, 'India', 8),

(41, 'Shubman Gill', 'Batter', 'Right-hand bat', 'Offbreak', 'India', 9),
(42, 'Rashid Khan', 'Bowler', 'Right-hand bat', 'Legbreak googly', 'Afghanistan', 9),
(43, 'David Miller', 'Batter', 'Left-hand bat', 'Offbreak', 'South Africa', 9),
(44, 'Mohammed Shami', 'Bowler', 'Right-hand bat', 'Right-arm fast', 'India', 9),
(45, 'Rahul Tewatia', 'All-rounder', 'Left-hand bat', 'Legbreak', 'India', 9),

(46, 'KL Rahul', 'Wicketkeeper', 'Right-hand bat', NULL, 'India', 10),
(47, 'Nicholas Pooran', 'Wicketkeeper', 'Left-hand bat', 'Offbreak', 'West Indies', 10),
(48, 'Marcus Stoinis', 'All-rounder', 'Right-hand bat', 'Right-arm medium', 'Australia', 10),
(49, 'Ravi Bishnoi', 'Bowler', 'Right-hand bat', 'Legbreak googly', 'India', 10),
(50, 'Krunal Pandya', 'All-rounder', 'Left-hand bat', 'Left-arm orthodox', 'India', 10);

-- =========================
-- 4. MATCHES TABLE
-- =========================
CREATE TABLE matches (
    match_id INT PRIMARY KEY,
    season_year INT NOT NULL,
    match_date DATE NOT NULL,
    venue_id INT,
    team1_id INT,
    team2_id INT,
    toss_winner_id INT,
    toss_decision VARCHAR(20),
    winner_id INT,
    win_by_runs INT DEFAULT 0,
    win_by_wickets INT DEFAULT 0,
    player_of_match_id INT,
    FOREIGN KEY (venue_id) REFERENCES venues(venue_id),
    FOREIGN KEY (team1_id) REFERENCES teams(team_id),
    FOREIGN KEY (team2_id) REFERENCES teams(team_id),
    FOREIGN KEY (toss_winner_id) REFERENCES teams(team_id),
    FOREIGN KEY (winner_id) REFERENCES teams(team_id),
    FOREIGN KEY (player_of_match_id) REFERENCES players(player_id)
);

INSERT INTO matches 
(match_id, season_year, match_date, venue_id, team1_id, team2_id, toss_winner_id, toss_decision, winner_id, win_by_runs, win_by_wickets, player_of_match_id) VALUES
(1, 2023, '2023-03-31', 9, 9, 1, 9, 'Field', 9, 0, 5, 41),
(2, 2023, '2023-04-01', 8, 8, 4, 4, 'Field', 8, 7, 0, 37),
(3, 2023, '2023-04-02', 10, 10, 5, 5, 'Bat', 10, 50, 0, 48),
(4, 2023, '2023-04-02', 7, 7, 6, 7, 'Field', 6, 72, 0, 27),
(5, 2023, '2023-04-03', 3, 3, 2, 3, 'Field', 3, 0, 8, 12),
(6, 2023, '2023-04-04', 5, 5, 9, 9, 'Field', 9, 0, 6, 41),
(7, 2023, '2023-04-05', 1, 1, 10, 10, 'Field', 1, 12, 0, 2),
(8, 2023, '2023-04-06', 4, 4, 3, 3, 'Field', 4, 81, 0, 18),
(9, 2023, '2023-04-07', 6, 6, 5, 5, 'Field', 6, 57, 0, 28),
(10, 2023, '2023-04-08', 2, 2, 1, 1, 'Field', 1, 0, 7, 3),
(11, 2023, '2023-04-09', 7, 7, 8, 7, 'Bat', 7, 8, 0, 33),
(12, 2023, '2023-04-10', 3, 3, 10, 10, 'Field', 10, 0, 1, 47),
(13, 2023, '2023-04-11', 5, 5, 2, 2, 'Field', 2, 0, 6, 6),
(14, 2023, '2023-04-12', 1, 1, 6, 1, 'Bat', 6, 0, 3, 27),
(15, 2023, '2023-04-13', 8, 8, 9, 9, 'Field', 9, 0, 6, 42),
(16, 2023, '2023-04-14', 4, 4, 7, 4, 'Bat', 7, 23, 0, 31),
(17, 2023, '2023-04-15', 2, 2, 4, 2, 'Field', 2, 0, 5, 7),
(18, 2023, '2023-04-16', 9, 9, 6, 6, 'Field', 6, 3, 0, 29),
(19, 2023, '2023-04-17', 3, 3, 1, 1, 'Field', 1, 0, 8, 5),
(20, 2023, '2023-04-18', 10, 10, 6, 6, 'Bat', 10, 10, 0, 46),

(21, 2024, '2024-03-22', 1, 1, 3, 3, 'Bat', 1, 6, 0, 2),
(22, 2024, '2024-03-23', 8, 8, 5, 8, 'Field', 8, 0, 4, 38),
(23, 2024, '2024-03-23', 4, 4, 7, 7, 'Field', 4, 4, 0, 17),
(24, 2024, '2024-03-24', 6, 6, 10, 6, 'Bat', 6, 20, 0, 26),
(25, 2024, '2024-03-24', 9, 9, 2, 2, 'Field', 9, 6, 0, 41),
(26, 2024, '2024-03-25', 3, 3, 8, 3, 'Field', 3, 0, 4, 11),
(27, 2024, '2024-03-26', 1, 1, 9, 9, 'Field', 1, 63, 0, 3),
(28, 2024, '2024-03-27', 7, 7, 2, 2, 'Field', 7, 31, 0, 35),
(29, 2024, '2024-03-28', 6, 6, 5, 5, 'Field', 6, 12, 0, 28),
(30, 2024, '2024-03-29', 3, 3, 4, 4, 'Field', 4, 0, 7, 18),
(31, 2024, '2024-03-30', 10, 10, 8, 10, 'Bat', 10, 21, 0, 47),
(32, 2024, '2024-03-31', 9, 9, 7, 7, 'Field', 9, 7, 0, 44),
(33, 2024, '2024-04-01', 2, 2, 6, 6, 'Bat', 6, 0, 6, 27),
(34, 2024, '2024-04-02', 3, 3, 10, 10, 'Field', 10, 0, 2, 48),
(35, 2024, '2024-04-03', 5, 5, 4, 4, 'Bat', 4, 0, 5, 16),
(36, 2024, '2024-04-04', 9, 9, 8, 8, 'Field', 8, 0, 3, 36),
(37, 2024, '2024-04-05', 7, 7, 1, 1, 'Field', 7, 25, 0, 33),
(38, 2024, '2024-04-06', 6, 6, 3, 6, 'Field', 6, 0, 6, 29),
(39, 2024, '2024-04-07', 2, 2, 5, 5, 'Bat', 2, 29, 0, 9),
(40, 2024, '2024-04-08', 1, 1, 4, 4, 'Field', 1, 7, 0, 1);

-- =========================
-- 5. PLAYER_MATCH_STATS TABLE
-- =========================
CREATE TABLE player_match_stats (
    stat_id INT PRIMARY KEY,
    match_id INT,
    player_id INT,
    team_id INT,
    runs_scored INT DEFAULT 0,
    balls_faced INT DEFAULT 0,
    fours INT DEFAULT 0,
    sixes INT DEFAULT 0,
    overs_bowled DECIMAL(3,1) DEFAULT 0,
    runs_conceded INT DEFAULT 0,
    wickets_taken INT DEFAULT 0,
    catches INT DEFAULT 0,
    stumpings INT DEFAULT 0,
    FOREIGN KEY (match_id) REFERENCES matches(match_id),
    FOREIGN KEY (player_id) REFERENCES players(player_id),
    FOREIGN KEY (team_id) REFERENCES teams(team_id)
);

INSERT INTO player_match_stats 
(stat_id, match_id, player_id, team_id, runs_scored, balls_faced, fours, sixes, overs_bowled, runs_conceded, wickets_taken, catches, stumpings) VALUES
(1,1,41,9,63,36,7,3,0,0,0,1,0),
(2,1,42,9,10,6,1,0,4.0,26,2,0,0),
(3,1,2,1,92,50,4,9,0,0,0,0,0),
(4,1,3,1,1,2,0,0,4.0,28,1,1,0),
(5,2,37,8,26,17,2,1,4.0,38,3,0,0),
(6,2,36,8,40,29,6,0,0,0,0,0,0),
(7,2,18,4,7,2,0,1,4.0,40,1,0,0),
(8,2,17,4,35,19,3,3,2.0,20,1,1,0),
(9,3,48,10,55,30,6,3,2.0,15,1,0,0),
(10,3,46,10,8,12,1,0,0,0,0,1,0),
(11,3,21,5,32,21,4,1,0,0,0,0,0),
(12,3,23,5,16,11,2,0,4.0,35,1,0,0),
(13,4,27,6,54,22,7,3,0,0,0,0,0),
(14,4,28,6,37,26,5,1,0,0,0,0,0),
(15,4,31,7,6,5,1,0,4.0,45,1,0,0),
(16,4,33,7,33,19,2,2,0,0,0,1,0),
(17,5,12,3,73,43,5,6,0,0,0,1,0),
(18,5,11,3,82,49,6,5,0,0,0,0,0),
(19,5,6,2,1,10,0,0,0,0,0,0,0),
(20,5,9,2,0,1,0,0,4.0,35,2,0,0),
(21,6,41,9,84,46,6,5,0,0,0,0,0),
(22,6,44,9,0,0,0,0,4.0,29,3,0,0),
(23,6,22,5,37,32,7,0,0,0,0,0,0),
(24,6,24,5,1,3,0,0,4.0,33,2,0,0),
(25,7,2,1,57,31,4,4,0,0,0,0,0),
(26,7,3,1,16,8,1,1,4.0,23,2,1,0),
(27,7,46,10,20,18,2,0,0,0,0,1,0),
(28,7,49,10,0,2,0,0,4.0,31,1,0,0),
(29,8,18,4,45,23,4,3,4.0,25,2,0,0),
(30,8,20,4,1,1,0,0,4.0,15,3,0,0),
(31,8,11,3,21,18,3,0,0,0,0,0,0),
(32,8,13,3,5,7,1,0,2.0,22,0,0,0),
(33,9,28,6,60,31,11,1,0,0,0,0,0),
(34,9,29,6,0,0,0,0,4.0,27,3,0,0),
(35,9,21,5,28,26,3,1,0,0,0,1,0),
(36,9,25,5,18,12,3,0,0,0,0,0,0),
(37,10,3,1,25,16,2,1,4.0,20,3,0,0),
(38,10,1,1,32,17,1,3,0,0,0,0,1),
(39,10,6,2,48,36,5,1,0,0,0,0,0),
(40,10,7,2,14,10,1,1,0,0,0,0,0),

(41,21,2,1,46,30,4,2,0,0,0,0,0),
(42,21,3,1,25,17,2,1,4.0,21,2,1,0),
(43,21,11,3,21,20,1,0,0,0,0,0,0),
(44,21,14,3,0,1,0,0,4.0,32,2,0,0),
(45,22,38,8,2,3,0,0,4.0,28,3,0,0),
(46,22,36,8,45,37,5,1,0,0,0,0,0),
(47,22,21,5,18,13,2,1,0,0,0,0,0),
(48,22,23,5,21,13,2,1,4.0,25,1,0,0),
(49,23,17,4,41,19,3,4,2.0,18,1,1,0),
(50,23,18,4,22,10,2,2,4.0,19,2,0,0),
(51,23,31,7,8,6,1,0,4.0,36,1,0,0),
(52,23,33,7,63,29,4,5,0,0,0,0,0),
(53,24,26,6,82,52,3,6,0,0,0,1,0),
(54,24,28,6,24,12,3,1,0,0,0,0,0),
(55,24,46,10,58,44,6,2,0,0,0,0,0),
(56,24,49,10,1,1,0,0,4.0,30,1,0,0),
(57,25,41,9,31,22,3,1,0,0,0,0,0),
(58,25,44,9,0,1,0,0,4.0,22,2,0,0),
(59,25,6,2,43,29,7,1,0,0,0,0,0),
(60,25,9,2,0,0,0,0,4.0,14,3,0,0),
(61,26,11,3,77,49,11,2,0,0,0,1,0),
(62,26,13,3,32,17,3,2,3.0,26,1,0,0),
(63,26,36,8,45,37,5,1,0,0,0,0,0),
(64,26,37,8,23,17,1,1,4.0,39,2,0,0),
(65,27,3,1,33,19,3,2,4.0,18,3,0,0),
(66,27,5,1,51,23,3,5,1.0,8,0,0,0),
(67,27,41,9,8,13,1,0,0,0,0,0,0),
(68,27,42,9,2,4,0,0,4.0,31,1,0,0),
(69,28,35,7,63,23,3,7,2.0,21,1,0,0),
(70,28,33,7,80,34,4,7,0,0,0,1,0),
(71,28,6,2,26,12,1,3,0,0,0,0,0),
(72,28,9,2,0,0,0,0,4.0,36,1,0,0),
(73,29,28,6,56,39,5,3,0,0,0,0,0),
(74,29,29,6,0,1,0,0,4.0,19,2,0,0),
(75,29,22,5,49,34,5,2,0,0,0,0,0),
(76,29,24,5,5,4,1,0,4.0,30,2,0,0),
(77,30,18,4,47,22,2,5,4.0,17,1,0,0),
(78,30,16,4,39,25,3,2,0,0,0,0,0),
(79,30,11,3,83,59,4,4,0,0,0,1,0),
(80,30,14,3,1,2,0,0,4.0,46,1,0,0),
(81,31,47,10,64,32,5,4,0,0,0,0,0),
(82,31,48,10,38,21,3,2,2.0,19,1,0,0),
(83,31,36,8,70,50,7,2,0,0,0,0,0),
(84,31,38,8,0,0,0,0,4.0,37,2,0,0),
(85,32,44,9,1,1,0,0,4.0,24,3,0,0),
(86,32,41,9,58,42,6,1,0,0,0,0,0),
(87,32,33,7,24,13,2,2,0,0,0,1,0),
(88,32,31,7,11,8,1,0,4.0,29,1,0,0),
(89,33,27,6,69,46,8,2,0,0,0,0,0),
(90,33,26,6,38,28,4,1,0,0,0,1,0),
(91,33,6,2,37,27,4,1,0,0,0,0,0),
(92,33,8,2,24,13,2,2,3.0,29,1,0,0),
(93,34,48,10,56,30,6,3,3.0,28,2,0,0),
(94,34,47,10,40,21,3,3,0,0,0,1,0),
(95,34,11,3,61,44,4,2,0,0,0,0,0),
(96,34,13,3,28,17,1,2,2.0,24,0,0,0),
(97,35,16,4,55,36,5,2,0,0,0,0,0),
(98,35,20,4,0,0,0,0,4.0,20,3,0,0),
(99,35,21,5,35,26,3,1,0,0,0,1,0),
(100,35,24,5,2,3,0,0,4.0,33,1,0,0),
(101,36,36,8,72,48,6,3,0,0,0,0,0),
(102,36,37,8,19,10,1,2,4.0,31,2,0,0),
(103,36,41,9,89,48,6,5,0,0,0,0,0),
(104,36,42,9,5,4,0,0,4.0,35,1,0,0),
(105,37,33,7,71,33,5,6,0,0,0,0,0),
(106,37,31,7,4,2,0,0,4.0,25,2,0,0),
(107,37,2,1,62,44,6,2,0,0,0,0,0),
(108,37,4,1,1,2,0,0,4.0,37,1,0,0),
(109,38,29,6,0,1,0,0,4.0,17,3,0,0),
(110,38,30,6,44,29,4,2,2.0,19,1,0,0),
(111,38,11,3,72,53,7,2,0,0,0,1,0),
(112,38,14,3,0,0,0,0,4.0,41,1,0,0),
(113,39,9,2,0,1,0,0,4.0,18,3,0,0),
(114,39,7,2,52,28,6,3,0,0,0,0,0),
(115,39,22,5,35,31,3,1,0,0,0,0,0),
(116,39,23,5,28,18,2,2,4.0,32,1,0,0),
(117,40,1,1,30,14,2,2,0,0,0,0,1),
(118,40,2,1,67,48,8,1,0,0,0,0,0),
(119,40,16,4,41,29,4,1,0,0,0,0,0),
(120,40,18,4,19,10,1,2,4.0,29,1,0,0);

-- =========================
-- 6. POINTS TABLE
-- =========================
CREATE TABLE points_table (
    points_id INT PRIMARY KEY,
    season_year INT,
    team_id INT,
    matches_played INT,
    wins INT,
    losses INT,
    no_result INT,
    points INT,
    net_run_rate DECIMAL(5,3),
    FOREIGN KEY (team_id) REFERENCES teams(team_id)
);

INSERT INTO points_table 
(points_id, season_year, team_id, matches_played, wins, losses, no_result, points, net_run_rate) VALUES
(1, 2023, 9, 14, 10, 4, 0, 20, 0.809),
(2, 2023, 1, 14, 8, 5, 1, 17, 0.652),
(3, 2023, 10, 14, 8, 5, 1, 17, 0.284),
(4, 2023, 2, 14, 8, 6, 0, 16, -0.044),
(5, 2023, 6, 14, 7, 7, 0, 14, 0.148),
(6, 2023, 3, 14, 7, 7, 0, 14, 0.135),
(7, 2023, 4, 14, 6, 8, 0, 12, -0.239),
(8, 2023, 8, 14, 6, 8, 0, 12, -0.304),
(9, 2023, 5, 14, 5, 9, 0, 10, -0.808),
(10, 2023, 7, 14, 4, 10, 0, 8, -0.590),

(11, 2024, 4, 14, 9, 3, 2, 20, 1.428),
(12, 2024, 7, 14, 8, 5, 1, 17, 0.414),
(13, 2024, 6, 14, 8, 5, 1, 17, 0.273),
(14, 2024, 3, 14, 7, 7, 0, 14, 0.459),
(15, 2024, 1, 14, 7, 7, 0, 14, 0.392),
(16, 2024, 5, 14, 7, 7, 0, 14, -0.377),
(17, 2024, 10, 14, 7, 7, 0, 14, -0.667),
(18, 2024, 9, 14, 5, 7, 2, 12, -1.063),
(19, 2024, 8, 14, 5, 9, 0, 10, -0.353),
(20, 2024, 2, 14, 4, 10, 0, 8, -0.318);

-- =========================
-- PRACTICE QUERIES
-- =========================

-- 1. Show all players with their team names
-- SELECT p.player_name, p.role, t.team_name
-- FROM players p
-- JOIN teams t ON p.team_id = t.team_id;

-- 2. Find top 10 run scorers from player_match_stats
-- SELECT p.player_name, SUM(s.runs_scored) AS total_runs
-- FROM player_match_stats s
-- JOIN players p ON s.player_id = p.player_id
-- GROUP BY p.player_name
-- ORDER BY total_runs DESC
-- LIMIT 10;

-- 3. Find top wicket takers
-- SELECT p.player_name, SUM(s.wickets_taken) AS total_wickets
-- FROM player_match_stats s
-- JOIN players p ON s.player_id = p.player_id
-- GROUP BY p.player_name
-- ORDER BY total_wickets DESC;

-- 4. Find matches won by each team
-- SELECT t.team_name, COUNT(*) AS matches_won
-- FROM matches m
-- JOIN teams t ON m.winner_id = t.team_id
-- GROUP BY t.team_name
-- ORDER BY matches_won DESC;

-- 5. Show match details with venue and winner
-- SELECT m.match_id, m.match_date, 
--        t1.short_name AS team1, t2.short_name AS team2,
--        v.venue_name, tw.team_name AS winner
-- FROM matches m
-- JOIN teams t1 ON m.team1_id = t1.team_id
-- JOIN teams t2 ON m.team2_id = t2.team_id
-- JOIN venues v ON m.venue_id = v.venue_id
-- JOIN teams tw ON m.winner_id = tw.team_id;

-- 6. Players who scored more than 50 runs in a match
-- SELECT p.player_name, t.short_name, s.runs_scored, m.match_date
-- FROM player_match_stats s
-- JOIN players p ON s.player_id = p.player_id
-- JOIN teams t ON s.team_id = t.team_id
-- JOIN matches m ON s.match_id = m.match_id
-- WHERE s.runs_scored > 50
-- ORDER BY s.runs_scored DESC;

-- 7. Team-wise total runs in this sample dataset
-- SELECT t.team_name, SUM(s.runs_scored) AS total_runs
-- FROM player_match_stats s
-- JOIN teams t ON s.team_id = t.team_id
-- GROUP BY t.team_name
-- ORDER BY total_runs DESC;

-- 8. City-wise number of matches
-- SELECT v.city, COUNT(m.match_id) AS total_matches
-- FROM matches m
-- JOIN venues v ON m.venue_id = v.venue_id
-- GROUP BY v.city
-- ORDER BY total_matches DESC;

-- 9. Find all-rounders and their total runs + wickets
-- SELECT p.player_name, t.short_name,
--        SUM(s.runs_scored) AS total_runs,
--        SUM(s.wickets_taken) AS total_wickets
-- FROM player_match_stats s
-- JOIN players p ON s.player_id = p.player_id
-- JOIN teams t ON p.team_id = t.team_id
-- WHERE p.role = 'All-rounder'
-- GROUP BY p.player_name, t.short_name
-- ORDER BY total_runs DESC;

-- 10. Points table for 2024
-- SELECT t.team_name, pt.matches_played, pt.wins, pt.losses, pt.points, pt.net_run_rate
-- FROM points_table pt
-- JOIN teams t ON pt.team_id = t.team_id
-- WHERE pt.season_year = 2024
-- ORDER BY pt.points DESC, pt.net_run_rate DESC;
