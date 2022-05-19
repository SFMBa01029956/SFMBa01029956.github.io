const hello = await fetch('http://localhost:port3000/api/hello', {
    method: 'GET'
})

const message = await hello.text()
console.log(message)