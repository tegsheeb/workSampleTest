CREATE DATABASE IF NOT EXISTS Part2;

USE Part2

CREATE TABLE IF NOT EXISTS users (
    user_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(100) NOT NULL,
    email VARCHAR(50) NOT NULL,
    first_name VARCHAR(26) NOT NULL,
    last_name VARCHAR(26) NOT NULL,
)

CREATE TABLE IF NOT EXISTS tweets (
    tweetID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    tweet VARCHAR(280),
    posted_date DATE NOT NULL, 
    user_id SMALLINT UNSIGNED NOT NULL,
    CONSTRAINT `user_id`
        FOREIGN KEY(user_id) REFERENCES users(user_id)
        ON DELETE CASCADE
        ON UPDATE RESTRICT
)

CREATE TABLE IF NOT EXISTS followers (
    user_id,
        CONSTRAINT `user_id`
        FOREIGN KEY(user_id) REFERENCES users(user_id)
        ON DELETE CASCADE
        ON UPDATE RESTRICT
    follower_id,
    CONSTRAINT `follower_id`
        FOREIGN KEY(follower_id) REFERENCES users(user_id)
        ON DELETE CASCADE
        ON UPDATE RESTRICT
)

1) 
username = "Mark" => get that id of that user 
on followers table follower_id = user_id of "Mark"
get all tweets by those user_id , and get list of the tweets
sort those tweets by time and get the latest 30

2) Join tables of users followed by mark and tweets from data is bigger than data - 1min
sort by data and get the latest 30 