-- 2.1) Query to retrieve the 30 latest tweets by users followed by the user with username "Mark".
SELECT u1.username, u1.first_name, u1.last_name, tweet_id, tweet, posted_date from users AS u1 
    LEFT JOIN tweets ON u1.user_id= tweets.tweets_user_id 
    INNER JOIN followers on tweets.tweets_user_id = followers.followers_user_id 
    INNER JOIN users AS u2 ON followers.followers_follower_id = u2.user_id 
        WHERE u2.username = "Mark" 
        ORDER BY posted_date 
        DESC LIMIT 30;

/*
    2.2) One minute later, to scroll down to next 30 tweets
    tweet_id is unique within entire database, therefore, I have refactored
    to include tweet_id into query result, so that I can retrieve back
    tweet_id of the last tweet of the the 30 last quiried from the front-end. 
    Also, there can be tweets posted at exact same momemt but one was already
    queried and others are still not queried. Therefore, passing the posted_date of
    the last tweet of the last 30 tweets already queried as an argument to when 
    fetching from endpoint. 
    When front-end fetches data from the endpoint, it will pass the last_tweet_id and 
    the last_posted_date of last of 30 tweets' as arguments. 
*/

$last_tweet_id = `passed_in_from_front_end`
$last_posted_date = `passed_in_from_front_end`

SELECT u1.username, u1.first_name, u1.last_name, tweet_id, tweet, posted_date from users AS u1 
    LEFT JOIN tweets ON u1.user_id= tweets.tweets_user_id 
    INNER JOIN followers on tweets.tweets_user_id = followers.followers_user_id 
    INNER JOIN users AS u2 ON followers.followers_follower_id = u2.user_id 
        WHERE u2.username = "Mark" AND posted_date <= $last_posted_date AND tweet_id < $last_tweet_id
        ORDER BY posted_date, tweet_id
        DESC LIMIT 30;