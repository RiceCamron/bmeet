const express = require("express");
const mysql = require("mysql2/promise");

let db = null;
const app = express();

app.use(express.json());

app.post('/create-user', async (req, res, next) => {
    const name = req.body.name;

    await db.query("INSERT INTO users (name) VALUES (?);", [name]);

    res.json({ status: "OK" });
    next();
});
// app.get('/meets', async (req, res, next) => {
//     const [rows] = await db.query("SELECT * FROM Meets;");

//     console.log('Работает!');
//     res.json(rows);
//     next();
// });

app.post('/meets', async(req, res, next) => {
    
    const [rows] = await db.query("SELECT * FROM Meets;");

    res.json(rows);

    console.log('Работает!');
    next();
});

async function main() {
    db = await mysql.createConnection({
        host: "localhost",
        port: "8889",
        user: "root",
        password: "root",
        database: "bmeet",
    });


    app.listen(8001);
}

main();