# Work Sample Test
In this repository, I implemented a short code sample in Go, MariaDB DDL and DQL, and a small React app.  

## 1. Go
A person struct, exactTwice() and atLeastTwice() functions are implemented with time complexity of O(n) and O(n^2). I wanted to keep the exponential solution included to show my naive approach, which I then optimized to linear time.  

## 2. MariaDB
For this part of the sample, I implemented schema in DDL to create a database for the part and tables for users, tweets and followers with MariaDB. Also, I created 2 queries as an answer to the sample work in `queries.sql` file. 

### To test with small dataset: 
There are query statements for small dataset in Schema.sql. To test with a small dataset, uncomment the statements starting from line 44 and run `mariadb < Schema.sql`. 

### To test with bigger dataset: 
This dataset has 100 entries for users table, 300 entries for tweets table, about 1000 entries for followers table. 
This testing requires Node version 12 or higher. To install Node, go to [this website](https://nodejs.org/en/). After installing Node, run `npm install` in the 2.MariaDB folder to install necessary packages. 

Before running the seeding script, import the schema into MariaDB with `mariadb < Schema.sql`. If you have uncommented query statements for testing with small dataset, go back and comment it out again. Also, please drop the database with small dataset with `mariadb -u username -p` and `drop database Part2TegsheeBaasan`, before seeding the database if you used small dataset. 

#### Run `npm run seed` to seed the database
This command will seed the data into database after `mariadb < Schema.sql`.

`config.example.js` file is provided to fill-in credentials. Fill in username and password for MariaDB and change the filename into `config.js` before running seeding script.


## 3. React
In this part, I implemented a small React app to change the color of the circle by entering color and clicking button. 

To run and test the app, run `npm start`. This testing requires Node version 12 or higher. To install Node, go to [this website](https://nodejs.org/en/). After installing Node, run `npm install` in the 3.React folder to install necessary packages. 

The following interactions can be tested with the app: 
  1. When a user enters a color and clicks the button, the color of the circle will change. 
  2. If a user enters an invalid color name and clicks and button, the color of the circle stays and app renders a message saying that user entered invalid color. 
  3. If a user clicks the button without entering color, the color of the circle stays and app renders a message saying that user did not enter color. 

