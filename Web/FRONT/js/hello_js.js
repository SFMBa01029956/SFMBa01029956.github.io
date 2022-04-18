/*
Diego Mellado Oliveros
Salvador Federico Milanes Braniff
*/

//1
function getFirstUniqueChar(xStr)
{
    for (let i = 0; i < xStr.length; i++) 
    {
        if (xStr.indexOf(xStr[i]) === xStr.lastIndexOf(xStr[i]))
        {
            return xStr[i]
        } 
    }
    return false
}

//2
function bubbleSort(xArray)
{
    let arrayLen = xArray.length

    for(let i = 0; i < arrayLen; i++)
    {
        for(let j = 0; j < arrayLen; j++)
        {
            if(xArray[j] > xArray[j + 1])
            {
                let swapVal = xArray[j]
                xArray[j] = xArray[j + 1]
                
                xArray[j + 1] = swapVal
            }
        }
    }
    return xArray;
}

//3
function quickSort(xArray)
{
    let arrayLen = xArray.length
    if (arrayLen <= 1)
    {
        return xArray
    }

    let pivot = xArray[0]

    let leftItems = []
    let rightItems = []

    for (let i = 1; i < arrayLen; i++)
    {
        xArray[i] < pivot ? leftItems.push(xArray[i]) : rightItems.push(xArray[i])
    }

    return quickSort(leftItems).concat(pivot, quickSort(rightItems))
}

//4
function invertArray(xArray)
{
    invArr = []
    let arrayLen = xArray.length

    for (let i = arrayLen - 1; i >= 0; i--)
    {
        invArr.push(xArray[i])
    }
    return invArr
}

//5
class Vector
{
    constructor(x, y, z)
    {
        this.x = x
        this.y = y
        this.z = z
    }

    xAxis(){return this.x}

    yAxis(){return this.y}
    
    zAxis(){return this.z}
}

//6
function MCD(num1, num2)
{
    if (!num2)
    {
        return num1
    }

    return MCD(num2, num1 % num2)
}

//7
function vecsOrtogonal(vec1, vec2)
{
    let x = vec1.xAxis() * vec2.xAxis()
    let y = vec1.yAxis() * vec2.yAxis()
    let z = vec1.zAxis() * vec2.zAxis()
    
    if (x + y + z === 0) 
    {
        return true
    }
    else
    {
        return false
    }
}

//8
function hckrSpeak(xStr)
{
    let hckrStr = ""
    
    for (let i = 0; i < xStr.length; i++) 
    {    
        if (xStr[i] === 'a')
        {
            hckrStr += '4'
        } 
        else if (xStr[i] === 'b')
        {
            hckrStr += '8'
        }
        else if (xStr[i] === "e")
        {
            hckrStr += '3'
        }
        else if (xStr[i] === 'i')
        {
            hckrStr += '1'
        }
        else if (xStr[i] === 'o')
        {
            hckrStr += '0'
        } 
        else if (xStr[i] === 's')
        {
            hckrStr += '5'
        } 
        else if (xStr[i] === 'z')
        {
            hckrStr.concat('2')
        }
        else
        {
            hckrStr += xStr[i]
        }
    }
    return hckrStr
}

//9
function findFactors(xInt)
{
    let facts = []
    let cont = 1

    while(cont <= xInt)
    {
        if(xInt % cont == 0)
        {
            facts.push(cont)
        }
        
        cont++        
    }
    return facts
}

//10
function rmvDuplicates(xArray)
{
    return xArray.filter((item, index) => xArray.indexOf(item) === index)
}

//TEST FUNCTIONS
function testFunctions()
{
    console.log("~~ 1. getFirstUniqueChar")
    console.log("abba: " + getFirstUniqueChar("abba"))
    console.log("ababdc: " + getFirstUniqueChar("ababdc"))
    console.log("dubdubpdubdub: " + getFirstUniqueChar("dubdubpdubdub"))

    console.log("~~ 2. bubbleSort")
    console.log("[3, 2, 5, 6, 1]: " + bubbleSort([3, 2, 5, 6, 1]))
    console.log("[9, 2.7, 15, 6, 14.6]: " + bubbleSort([9, 2.7, 15, 6, 14.6]))
    console.log("[3.1, 3.5, 3.17, 3.99, 3.98]: " + bubbleSort([3.1, 3.5, 3.17, 3.99, 3.98]))

    console.log("~~ 3. quicksort")
    console.log("[3, 2, 5, 6, 1]: " + quickSort([3, 2, 5, 6, 1]))
    console.log("[9, 2.7, 15, 6, 14.6]: " + quickSort([9, 2.7, 15, 6, 14.6]))
    console.log("[3.1, 3.5, 3.17, 3.99, 3.98]: " + quickSort([3.1, 3.5, 3.17, 3.99, 3.98]))
    
    console.log("~~ 4. invertArray")
    console.log("[3, 2, 5, 6, 1]: " + invertArray([3, 2, 5, 6, 1]))
    console.log("[9, 2.7, 15, 6, 14.6]: " + invertArray([9, 2.7, 15, 6, 14.6]))
    console.log("[3.1, 3.5, 3.17, 3.99, 3.98]: " + invertArray([3.1, 3.5, 3.17, 3.99, 3.98]))

    console.log("~~ 5. Vector")
    console.log(new Vector(1, 2, 4))
    console.log(new Vector(17, -42, 3.4))
    console.log(new Vector(91, 0, 6))

    console.log("~~ 6. MCD")
    console.log(" 36 & 60: " + MCD(36, 60))
    console.log(" 17 &  4: " + MCD(17, 4))
    console.log("360 & 32: " + MCD(360, 32))

    console.log("~~ 7. vecsOrtogonal")
    console.log("(-2, 4, 9) & ( 3,-3, 2): " + vecsOrtogonal(new Vector(-2,4,9), new Vector(3,-3,2))) 
    console.log("( 2, 3, 4) & ( 5, 3, 7): " + vecsOrtogonal(new Vector(2,3,4), new Vector(5,3,7)))
    console.log("( 0, 0, 0) & ( 1, 6,-4): " + vecsOrtogonal(new Vector(0,0,0), new Vector(1,6,4)))
    
    console.log("~~ 8. hckrSpeak")
    console.log('"Hello World!": ' + hckrSpeak("Hello World!"))
    console.log('"Shrek: The musical": ' + hckrSpeak("Shrek: The musical"))
    console.log('"Javascript es divertido": ' + hckrSpeak("Javascript es divertido"))
    
    console.log("~~ 9. findFactors")
    console.log("12: " + findFactors(12))
    console.log("48: " + findFactors(48))
    console.log("7: " + findFactors(7))
    
    console.log("~~ 10. rmvDuplicates")
    console.log('["apricot", "mango" ,"apricot"]: ' + rmvDuplicates(["apricot", "mango" ,"apricot"]))
    console.log('[2, 5, 3, 4, 8, 5, 5, 2, 3, 8]: ' + rmvDuplicates([2, 5, 3, 4, 8, 5, 5, 2, 3, 8]))
    console.log('["a", "b", "b", "c", "b", "c"]: ' + rmvDuplicates(["a", "b", "b", "c", "b", "c"]))
}

testFunctions()