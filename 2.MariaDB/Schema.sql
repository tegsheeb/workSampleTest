CREATE DATABASE IF NOT EXISTS Part2TegsheeBaasan;

USE Part2TegsheeBaasan

CREATE TABLE IF NOT EXISTS users (
    user_id INT NOT NULL AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(50) NOT NULL,
    first_name VARCHAR(26) NOT NULL,
    last_name VARCHAR(26) NOT NULL,
    PRIMARY KEY(user_id)
);

CREATE TABLE IF NOT EXISTS tweets (
    tweetID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    tweet TEXT,
    posted_date DATETIME NOT NULL, 
    tweets_user_id INT NOT NULL,
    FOREIGN KEY(tweets_user_id) REFERENCES users(user_id)
    ON DELETE CASCADE
    ON UPDATE RESTRICT
);

CREATE TABLE IF NOT EXISTS followers (
    followers_user_id INT NOT NULL,
    followers_follower_id INT NOT NULL,
    FOREIGN KEY(followers_user_id) REFERENCES users(user_id)
    ON DELETE CASCADE
    ON UPDATE RESTRICT,
    FOREIGN KEY(followers_follower_id) REFERENCES users(user_id)
    ON DELETE CASCADE
    ON UPDATE RESTRICT
);

-- 2.1) Query to retrieve the 30 latest tweets by users followed by the user with username "Mark".
SELECT u1.username, u1.first_name, u1.last_name, tweet, posted_date from users AS u1 LEFT JOIN tweets ON u1.user_id= tweets.tweets_user_id INNER JOIN followers on tweets.tweets_user_id = followers.followers_user_id 
                    INNER JOIN users AS u2 ON followers.followers_follower_id = u2.user_id WHERE u2.username = "Mark" ORDER BY posted_date DESC LIMIT 30;

-- 2.2) One minute later, to scroll down to next 30 tweets
-- Within 1 minutes, there are more tweets are added and loaded.
SELECT u1.username, u1.first_name, u1.last_name, tweet, posted_date from users AS u1 LEFT JOIN tweets ON u1.user_id= tweets.tweets_user_id INNER JOIN followers on tweets.tweets_user_id = followers.followers_user_id 
                    INNER JOIN users AS u2 ON followers.followers_follower_id = u2.user_id WHERE u2.username = "Mark" ORDER BY posted_date DESC LIMIT 30 OFFSET 60;

/* -- For small testing 
INSERT INTO users(username, email, first_name, last_name) VALUES('kevin12', 'kevin@gmail.com', 'kevin', 'v');
INSERT INTO users(username, email, first_name, last_name) VALUES('kevin121', 'kevin1@gmail.com', 'kevin', 'v');
INSERT INTO users(username, email, first_name, last_name) VALUES('kevin122', 'kevin2@gmail.com', 'kevin', 'v');
INSERT INTO users(username, email, first_name, last_name) VALUES('kevin123', 'kevin3@gmail.com', 'kevin', 'v');
INSERT INTO users(username, email, first_name, last_name) VALUES('kevin124', 'kevin4@gmail.com', 'kevin', 'v');
INSERT INTO users(username, email, first_name, last_name) VALUES('kevin125', 'kevin5@gmail.com', 'kevin', 'v');
INSERT INTO users(username, email, first_name, last_name) VALUES('Mark', 'mark@gmail.com', 'mark', 'v');


INSERT INTO tweets(tweet, posted_date, tweets_user_id) VALUES ('hfjshdfhdjkfhs', '2020-09-15 23:12:15', 1);
INSERT INTO tweets(tweet, posted_date, tweets_user_id) VALUES ('ipodasokdas', '2020-09-15 23:14:15', 1);
INSERT INTO tweets(tweet, posted_date, tweets_user_id) VALUES ('fjsdkljfs', '2020-09-15 23:15:15', 1);
INSERT INTO tweets(tweet, posted_date, tweets_user_id) VALUES ('jfkldjs', '2020-09-15 23:12:10', 2);
INSERT INTO tweets(tweet, posted_date, tweets_user_id) VALUES ('hfjshdfhdjkfhs', '2020-09-15 23:11:15', 4);
INSERT INTO tweets(tweet, posted_date, tweets_user_id) VALUES ('hfjshdfhdjkfhs', '2020-09-15 23:12:03', 6);
INSERT INTO tweets(tweet, posted_date, tweets_user_id) VALUES ('hfjshdfhdjkfhs', '2020-09-15 23:11:59', 5);
INSERT INTO tweets(tweet, posted_date, tweets_user_id) VALUES ('hfjshdfhdjkfhs', '2020-09-15 23:11:54', 5);
INSERT INTO tweets(tweet, posted_date, tweets_user_id) VALUES ('hfjshdfhdjkfhs', '2020-09-15 23:11:58', 7);
INSERT INTO tweets(tweet, posted_date, tweets_user_id) VALUES ('hfjshdfhdjkfhs', '2020-09-15 23:11:57', 2);


INSERT INTO followers(followers_user_id, followers_follower_id) VALUE(1, 4);
INSERT INTO followers(followers_user_id, followers_follower_id) VALUE(3, 2);
INSERT INTO followers(followers_user_id, followers_follower_id) VALUE(2, 4);
INSERT INTO followers(followers_user_id, followers_follower_id) VALUE(4, 7);
INSERT INTO followers(followers_user_id, followers_follower_id) VALUE(1, 7);
INSERT INTO followers(followers_user_id, followers_follower_id) VALUE(2, 7);
INSERT INTO followers(followers_user_id, followers_follower_id) VALUE(5, 7);
INSERT INTO followers(followers_user_id, followers_follower_id) VALUE(6, 5);
INSERT INTO followers(followers_user_id, followers_follower_id) VALUE(1, 6);
INSERT INTO followers(followers_user_id, followers_follower_id) VALUE(5, 6);
INSERT INTO followers(followers_user_id, followers_follower_id) VALUE(7, 4);
*/
