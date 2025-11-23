const express = require('express');
require('dotenv').config();
const mysql = require('mysql2');
const cors = require('cors');
const { v4: uuidv4 } = require('uuid');
const app = express();

const port = process.env.PORT;

app.use(cors());
app.use(express.json());

const db = mysql.createConnection({
    host: process.env.DB_HOST,
    user: process.env.DB_USER, 
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME  
});

// connect to the database
db.connect((err) => {
    if (err) {
        console.error('Error connecting to the database:', err);
        return;
    }
    console.log('Connected to the database');
})

app.post('/api/users', (req, res) => {
   const {  } = req.body;
   const id = uuidv4();
   const sql = 'INSERT INTO users (id, name, email, phone_number) VALUES (?, ?, ?, ?)';
   
   db.query(sql, [id, name, email, phone_number], (err, result) => {
	if (err) {
	    console.error('Error inserting user:', err);
            return res.status(500).json({ error: 'Error inserting user' });
	}
    return res.status(201).json({ message: 'User created successfully', userId: id });
	        

   })
})



app.listen(port, () => {
  console.log(Server is running on port ${port});
});
