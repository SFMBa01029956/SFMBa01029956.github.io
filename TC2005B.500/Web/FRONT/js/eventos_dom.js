document.addEventListener("mousemove", (event) =>
{
    const mousePos = document.getElementById('mousePosition')
    mousePosition.innerHTML = `Mouse position: ${event.clientX} - ${event.clientY}`

})

document.addEventListener("submit", (event) =>
{
    const name = document.getElementById('name')
    name 
})