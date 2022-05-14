class users
{
    constructor(name, surname, email)
    {
        this.name = name
        this.surname = surname
        this.email = email
    }

    getInfo()
    {
        return `Name: ${this.name} ${this.surname} Email: ${this.email}`
    }
    printInfo()
    {
        console.log(`Name: ${this.name} ${this.surname} Email: ${this.email}`)
    }

    renderInfo()
    {
        document.createElement("p")
    }
}

export default users