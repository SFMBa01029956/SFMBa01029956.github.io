"use strict"

import express from 'express'
import fs from 'fs'

const app = express()
const port = 3000

app.use(express.json())
app.use('/CSS', express.static('./CSS'))
app.use('/JS', express.static('./JS'))

app.get('/', (req, res)=>
{
    fs.readFile('./HTML/helloWorld.html', 'utf8', 
    (err, html) => {
        if(err)
        {
            res.status(500).send('There was an error: ' + err)
            return 
        }
        
        console.log("Sending page...")
        res.send(html)
        console.log("Page sent!")
    })
})

app.get('/api/hello',(req, res)=>
{
    console.log(req)
    if(req.query.name !== undefined)
        res.send(`hello ${req.query.name} ${req.query.surname}`)
    else
        res.send('hello!')
})

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})