const http = require('http');
const hostname = '127.0.0.1';
const port = 3000;
var cors = require('cors');

var mysql = require('mysql');

var con = mysql.createConnection({
  	host: "localhost",
	database: "inews",
  	user: "test1",
  	password: "p_00195H2uHk2j3"
});

/*con.connect(function(err) {
  if (err) throw err;
  	console.log("Connected!");
	let sql = 'SELECT * FROM prefix_news;';

	con.query(sql, function (err, result, fields) {
    if (err) throw err;
    console.log("Result: ", result);
    //console.log(result); // собственно данные
    //console.log(fields); // мета-данные полей
  });
});*/



/*
const server = http.createServer((req, res) => {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/plain');
  res.end('Hello there! General Kenobi!');
});

server.listen(port, hostname, () => {
  console.log(`Server running at http://${hostname}:${port}/`);
});
server.on('request', (request, response) => {
	// the same kind of magic happens here!
});*/


const express = require('express');
const path = require('path');
const app = express();
//const bodyParser = require("body-parser");
app.use(cors());

// place holder for the data
const news = [];

//app.use(bodyParser.json());

app.post('/api/news', (req, res) => {//http://localhost:3000/api/news
	console.log('api/news called!')
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader('Access-Control-Allow-Headers', 'origin, content-type, accept');
	res.json(news);
});

app.listen(port, () => {
	console.log(`Server listening on the port::${port}`);
});