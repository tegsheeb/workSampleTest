CREATE DATABASE IF NOT EXISTS Part2;

USE Part2

CREATE TABLE IF NOT EXISTS users (
    user_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(100) NOT NULL,
    email VARCHAR(50) NOT NULL,
    first_name VARCHAR(26) NOT NULL,
    last_name VARCHAR(26) NOT NULL
);

CREATE TABLE IF NOT EXISTS tweets (
    tweetID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    tweet VARCHAR(280),
    posted_date DATE NOT NULL, 
    user_id INT NOT NULL,
    FOREIGN KEY(user_id) REFERENCES users(user_id)
    ON DELETE CASCADE
    ON UPDATE RESTRICT
);

CREATE TABLE IF NOT EXISTS followers (
    user_id INT NOT NULL,
    follower_id INT NOT NULL,
    FOREIGN KEY(user_id) REFERENCES users(user_id)
    ON DELETE CASCADE
    ON UPDATE RESTRICT,
    FOREIGN KEY(follower_id) REFERENCES users(user_id)
    ON DELETE CASCADE
    ON UPDATE RESTRICT
);

INSERT 


-- tweets followed by follower named "mark"
SELECT * FROM tweets INNER JOIN users ON tweets.used_id = users.user_id 



where users.user_id   




INNER JOIN followers on = (select user_id from users where users.user_id = (select user_id from where users.username = "Mark")




SELECT * FROM users INNER JOIN followers ON users.user_id = followers_

users.username = "Mark"

INNER JOIN


-- Pseudocode
-- 1) 
-- username = "Mark" => get that id of that user 
-- on followers table follower_id = user_id of "Mark"
-- get all tweets by those user_id , and get list of the tweets
-- sort those tweets by time and get the latest 30



-- 2) Join tables of users followed by mark and tweets from data is bigger than data - 1min
-- sort by data and get the latest 30 