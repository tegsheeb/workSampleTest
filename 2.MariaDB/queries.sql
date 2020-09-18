-- 2.1) Query to retrieve the 30 latest tweets by users followed by the user with username "Mark".
SELECT u1.username, u1.first_name, u1.last_name, tweet, posted_date from users AS u1 
    LEFT JOIN tweets ON u1.user_id= tweets.tweets_user_id 
    INNER JOIN followers on tweets.tweets_user_id = followers.followers_user_id 
    INNER JOIN users AS u2 ON followers.followers_follower_id = u2.user_id 
        WHERE u2.username = "Mark" 
        ORDER BY posted_date 
        DESC LIMIT 30;

-- 2.2) One minute later, to scroll down to next 30 tweets
-- Within 1 minutes, there are more tweets are added and loaded.
SELECT u1.username, u1.first_name, u1.last_name, tweet, posted_date from users AS u1 
    LEFT JOIN tweets ON u1.user_id= tweets.tweets_user_id 
    INNER JOIN followers on tweets.tweets_user_id = followers.followers_user_id 
    INNER JOIN users AS u2 ON followers.followers_follower_id = u2.user_id 
        WHERE u2.username = "Mark" 
        ORDER BY posted_date 
        DESC LIMIT 30 OFFSET 60;