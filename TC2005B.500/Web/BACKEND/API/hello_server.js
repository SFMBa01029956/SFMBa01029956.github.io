app.get('/',(req,res)=>
{
    fs.readFile('./html/helloWorld1.html','utf8',(err,html) => {
        if(err)
            res.status(500).send('There was an error.\n ' + err)
        res.send(html)
        console.log("Page sent!")
    })
})