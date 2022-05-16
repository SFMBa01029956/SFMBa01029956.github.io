export class student
{
    constructor(name, surname, email)
    {
        this.name = name
        this.surname = surname
        this.email = email
    }

    logInfo()
    {
        console.log(`Name: ${this.name}\nSurname: ${this.surname}\nEmail: ${this.email}`)
    }
}

//export { student }