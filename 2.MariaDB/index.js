const mariadb = require('mariadb');
const connection = mariadb.createConnection({
     host: 'localhost', 
     user: 'FILL_ME', 
     password:'FILL_ME',
     database:'Part2TegsheeBaasan',
     connectionLimit: 5
});

module.exports = connection;
