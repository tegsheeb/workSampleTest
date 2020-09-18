const config = require('./config.js');
const mariadb = require('mariadb');
const connection = mariadb.createConnection({
     host: 'localhost', 
     user: config.USERNAME_mariadb_server,
     password: config.PASSWORD_mariadb_server,
     database:'Part2TegsheeBaasan',
     connectionLimit: 5
});

module.exports = connection;
