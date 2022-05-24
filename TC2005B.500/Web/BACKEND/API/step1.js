//1) Importing dependencies (mysql, express & fs [API])
import mysql from "mysql2/promise"
import express from "express"
import fs from "fs" //Processing files within NODE

const app = express() //Creating app instanziating express
const port = 3000 //Assigning a port from localhost [THIS PORT WILL CHANGE DEPENDING ON SERVER NATURE]

let connection = null; //Create connection var

//Creating API
app.use(express.json())
app.use("./CSS", express.static("./CSS")) //Establishing CSS Files path
app.use("./JS", express.static("./JS")) //Establishing JS Files path

//Establish connection with database (mysql)
try 
{
    //Creating connection as an async method
    connection = await mysql.createConnection({
        host: "localhost", //This host will change on database location and nature
        user: "salva4456", //User with privileges for accesing and modifying the sql data.
        password: "0Gsc4Aah9Tla", //Defined on workbench
        database: "api_game_db"
    })

    console.log("Connection established!") //On connection succesful

    const[rows, fields] = await connection.execute("select * from users"); //Assign range of data of sql to vars

}
catch(error) 
{
    console.log(error) //Handle failed connection
}
finally
{
    if(connection !== null) {
        connection.end()
    }
    console.log("Connection closed succesfully") //On ending connection (could use connection pooler)
}

app.get()