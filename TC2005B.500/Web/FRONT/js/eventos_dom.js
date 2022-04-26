document.addEventListener("mousemove", (event) =>
{
    const mousePosition = document.getElementById('mousePosition')
    mousePosition.innerHTML = `Mouse position: ${event.clientX} - ${event.clientY}`
})

document.addEventListener("submit", (event) =>
{
    event.preventDefault()
    const fname = document.getElementsByName('fname')
    const lname = document.getElementsByName('lname')
    const name = document.getElementById('name')
    name.innerHTML = `${fname[0].value} ${lname[0].value}`
})

function insertRow()
{
    const thisTable = document.getElementById('sampleTable')

    let newRow = thisTable.insertRow()
    let xRows = thisTable.rows.length
    let xCols = thisTable.rows[0].cells.length

    for(i = 0; i < xCols; i++)
    {
        let newCell = newRow.insertCell(i)
        newCell.innerHTML = `Row ${xRows} column ${i+1}`
    }
}

function insertColumn()
{
    const thisTable = document.getElementById('sampleTable')

    let xRows = thisTable.rows.length
    let xCols = thisTable.rows[0].cells.length

    for(i = 0; i < xRows; i++)
    {
        let row = thisTable.rows[i]
        let newCol = row.insertCell()
        newCol.innerHTML = `Row ${i+1} column ${xCols+1}`
    }
}

function changeContent()
{
    const thisTable = document.getElementById('myTable')
    const thisRow = document.getElementsByName('row')
    const thisCol = document.getElementsByName('col')
    const value = document.getElementsByName('val')

    thisTable.rows[thisRow].cells[thisCol].innerHTML=value
}