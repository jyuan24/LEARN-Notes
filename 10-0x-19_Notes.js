// ES6 Syntax

greeter2 = (name) => {
    return "hello" + name
}
// 






// es6 allows putting strings on different lines w/o using \n
let oldLongString = 'This\nis\na\nlong\nstring'
//  = >
let longString= `
This
is
a
long
string
`
// console.log (oldLongString) = console.log (longString)

/////////////////////////////////////////////////////

// SPREAD SYNTAX
//  allows us to copy array - we can perform mutator without changing org array
// spread operator - can pass a dynamic number of arguments
//create a function that takes in arguments of letters and joins them

//example
getWord = (...letters) => letters.join("")







//STRING INTERPOLATION
//  pretty much what was mentioned above...strings w/o ""
greeter = (name) => "hello " + name
greeter = (name) => `Hello, there ${name}`
// console.log(greeter("Learn Student"))
// console.log(greeter(48))

///////////////////////////////////////////////////


//OBJECTS
var myBook = }
title: "Hitchhiker's Guide to the Galaxy",
author: "Douglas Adams",
characters: {
    name1: "",
    name2: "",
    name3: ""
}
}
//above incomplete




//OBJECT DESTRUCTURING
//-> myBook
//  -> characters
//      -> name => value
//let{name} = myBook.characters



//sarah will be pushing notes into github to see...







//EXERCISES

// destructuring

// exercise 1


// let author = {
//     name: "H. G. Wells",
//     genre: "science fiction"
// }
// var { name, genre } = author
// console.log(`${name} is a ${genre} author`)

//------------
//
// var allPokemon = {
//     pokeOne: {
//         species: "Charmander",
//         pokemon_type: "Fire"
//     },
//     pokeTwo: {
//         species: "Magikarp",
//         pokemon_type: "Water"
//     },
//     describePokemon(){
//         var { species, pokemon_type } = allPokemon.pokeOne
//         var { species, pokemon_type } = allPokemon.pokeTwo
//         return `${species} is a ${pokemon_type} pokemon`
//     },
// }
//
// console.log(allPokemon.describePokemon())

 //-->> 'Charmandar is a Fire pokemon'
// console.log(allPokemon.pokeTwo) //-->> 'Magikarp is a Water pokemon'
//
// let pokeOne = {
//     species: "Charmandar",
//     pokemon_type: "Fire"
// }
//
// let pokeTwo = {
//     species: "Magikarp",
//     pokemon_type: "Water"
// }
//
// describePokemon = (object) => {
//     return `${object.species} is a ${object.pokemon_type} pokemon`
// }
//
// // var { species, pokemon_type } = pokeOne
// // var { species, pokemon_type } = pokeTwo
//
// console.log(describePokemon(pokeOne)) //-->> 'Charmandar is a Fire pokemon'
// console.log(describePokemon(pokeTwo)) //-->> 'Magikarp is a Water pokemon'



// // spread exercise 1
// //  old method
// function combineArrays(arrOne, arrTwo) {
//   return arrOne.concat(arrTwo)
// }
// console.log(combineArrays([2, 4, 2], [4, 6, 11]))
//
// // spread method
// var arr1 = [2,4,2]
// var arr2 = [4,6,11]
// var combineArrs = [...arr1, ...arr2]
// console.log(combineArrs)
//spread exercise 2

// function combineAndFilterOdd(arrOne, arrTwo, arrThree){
//   return arrOne.concat(arrTwo).concat(arrThree).filter(num => num % 2 != 0)
// }
//
// console.log(combineAndFilterOdd([3, 2, 5], [5, 8, 7], [4, 5, 6]))

// var arr1 = [3, 2, 5]
// var arr2 = [5, 8, 7]
// var arr3 = [4, 5, 6]
//
// var combineArrs = [...arr1, ...arr2, ...arr3]
// var filterArr = combineArrs.filter(num => num % 2 !== 0)
//
// console.log(filterArr)


// template literals
// 1
// var meaningOfLife = 42
// console.log(`The answer to the meaning of life is ${meaningOfLife}`)
//2

// var zooAnimals = ['giraffe', 'fennec fox', 'elephant']
//
// zooAnimals.forEach(animal => console.log(`The zoo has a ${animal}`))

//3
// var beanBurger = {
//     cheese: 'cheddar',
//     patty: 'black bean',
//     onions: false,
// }
//
// var turkeyBurger = {
//     cheese: 'swiss',
//     patty: 'turkey',
//     onions: true,
// }
//
//
// describeBurger = (object) => {
//     if (object.onions === true) {
//         return `${object.patty} burger with ${object.cheese} and onions`
//     } else {
//         return `${object.patty} burger with ${object.cheese} and no onions`
//     }
// }
//
// console.log(describeBurger(beanBurger))
// console.log(describeBurger(turkeyBurger))

//3.2

var beanBurger = {
    cheese: 'cheddar',
    patty: 'black bean',
    onions: false,
    tomato: true
}

var turkeyBurger = {
    cheese: 'swiss',
    patty: 'turkey',
    onions: true,
    tomato: false
}


describeBurger = (object) => {

        return `${object.patty} burger with ${object.cheese} and ${object.onions === true ? "onion" : "no onion"} and ${object.tomato === true ? "tomato" : "no tomato"}`

}

console.log(describeBurger(beanBurger))
console.log(describeBurger(turkeyBurger))
