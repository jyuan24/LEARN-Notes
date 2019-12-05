// React States

// react states are objects managed within a component
// - a component w/o state is called "pure component" or "dumb component"
// - a component w/ state is called "impure component" or "smart component"
// - you can change object by calling setState()
// - you should NOT change this.state directly ever, use this.setState

// - if component does not have state literally in the file, it is a component that does not have state
// - one thing to keep in mind - if there is a state, there is a constructor, not necessarily other way around

// the render () contains 
//     let {count} = this.state... 
// let {count} can be set outside the render, but it will still need to be called out within the render





import React, { Component } from 'react';

class Counter extends Component {
  constructor(props){
    super(props)
      this.state = {
        count: 0
    }
}

handleChange = () => {
    let newCount = this.state.count + 1
    this.setState({count: newCount})
}



  render() {
      let { count } = this.state

    return (
        <div>
        <h1>count: {count}</h1>
        <button onClick = {this.handleChange}>Press Me!</button>
        </div>

    );
  }
}

export default Counter;


// ---------------------------------------------------------------------------


Challenge 1 - Light Bulb Challenge
In the terminal,

make sure you're on the desktop and use create-react-app plus your project name
cd into your project
type atom .
take out any starter code you want to remove
As a user I can see a square on the screen with the word 'off' in the middle.

we will need for user:
- button - html
- square - css
- text - html
- state - react constructor
- app - create-react-app




As a user I can click anywhere on the square. When I click the square the words change from 'off' to 'on' and then back 'off' again.

we will need for 2nd user:
- onClick
- handleChange
- if/else, or ternary





=======================================================================

Github LIES

say you're working on code

after pushing to github
pull & merge on github to combine brand w/ master
you MUST type 'git pull' when working on a branch after checking out master branch

