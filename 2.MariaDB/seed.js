const faker = require('faker');
const db = require('./index.js');
// const mariadb = require('mariadb');


const createSeedData = (callback) => {
  const usersData = [];
  const tweetsData = [];
  const followersData = [];
  for (let i = 0; i < 99; i += 1) {
    const user = {
      username: faker.internet.userName(),
      email: faker.internet.exampleEmail(),
      first_name: faker.name.firstName(),
      last_name: faker.name.lastName() };
    usersData.push(user);
  }
  const user = {
    username: "Mark",
    email: faker.internet.exampleEmail(),
    first_name: faker.name.firstName(),
    last_name: faker.name.lastName() };
    usersData.push(user);
  for (let i = 0; i < 50; i += 1) {
    for (let j = 10; j < 16; j += 1) {
      const tweet = {
        tweet: faker.random.words(Math.random() * ( 15 - 0) + 1),
        posted_date: `2020-09-0${j} 0${j}:${j}:00`,
        tweets_user_id: Math.floor(Math.random() * (100 - 0) + 1)
      }
      tweetsData.push(tweet);
    }
  }
  for (let i = 1; i <= 100; i += 1) {
    for (let j = 0; j < 10; j++) {
      const follower_id = Math.floor(Math.random() * (100 - 0) + 1); 
      if (follower_id !== i) {
        const follower = {
          followers_user_id: i, 
          followers_follower_id: follower_id
        };
        followersData.push(follower);
      }
    }
  }

  callback(usersData, tweetsData, followersData);
};

const loadData = (usersArray, tweetsArray, followersArray) => {
  for(let i = 0; i < usersArray.length; i += 1) {
    const user = usersArray[i];
    db
    .then(conn => {
      conn.query("INSERT INTO users(username, email, first_name, last_name) VALUE(?, ?, ?, ?)", [user.username, user.email, user.first_name, user.last_name])
        .then((res) => {
          console.log(res);
        })
        .catch(err => {
          console.log(err); 
        })
    }).catch(err => {
        console.log('Not connected error:', err);
    });
  }

  for(let i = 0; i < tweetsArray.length; i += 1) {
    const tweet = tweetsArray[i];
    db
    .then(conn => {
      conn.query("INSERT INTO tweets(tweet, posted_date, tweets_user_id) VALUES (?, ?, ?)", [tweet.tweet, tweet.posted_date, tweet.tweets_user_id])
        .then((res) => {
          console.log(res);
        })
        .catch(err => {
          console.log(err); 
        })
    }).catch(err => {
        console.log('Not connected error:', err);
    });
  }

  for(let i = 0; i < followersArray.length; i += 1) {
    const follower = followersArray[i];
    db
    .then(conn => {
      conn.query("INSERT INTO followers(followers_user_id, followers_follower_id) VALUE(?, ?)", [follower.followers_user_id, follower.followers_follower_id])
        .then((res) => {
          console.log(res);
        })
        .catch(err => {
          console.log(err); 
        })
    }).catch(err => {
        console.log('Not connected error:', err);
    });
  }
  console.log('All Data Loaded');
};

createSeedData((usersData, tweetsData, followersData) => {
  loadData(usersData, tweetsData, followersData);
});

