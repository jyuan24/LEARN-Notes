building out react-in-rails from dog tinder back end

- run through webpacker stuff in terminal
- need page controller as well as dog controller
    rails g controller Pages
- add root to pages controller
- add root to: # in routes file below resources
    - resources is all the js restful routes
- add the get '*path' thing above resources : in routes -> picks up all html so this has to be picked up first
- add root.html.erb to pages should now allow page to render empty no error
- add component using rails g react:component MainApp
    - mainapp wil now be in js components mainapp
- add <%= %> reactcomponent tag to pages folder .html.erb file
- rails g react:component Dogs to create source for lsiting all dogs
- yarn add react-router-dom to add routes 
- in mainapp, import {BrowserRouter as Router, route, link} from react-router-dom
    - finish wrapping routes into <Route> tags
    - <Route path="/" component={Dogs} />
    - add import Dogs from './Dogs'
    - add text into Dogs.js file to test
- check /dogs.json now shows json stuff
- add api folder into javascript
- add index folder into api
- in index const getDogs = () =>{
    return fetch("/dogs")               -> from api/server
    .then((response)=>{
        if(response.status === 200){
            return response.json()
        }else{
            return new Promise(()=>{            -> promise is required for react to know what to find unless components are modified
                resolve ({error: 'There was an error.'})
            })
        }
    })
}
export{
    getDogs
}
- import above into dogs.js import {getDogs} from '../api'
- in dogs.js under constructor & super this.state = {} dogs: []
    - loadDogs = () =>{
    
}

- in dogs.js
    - loadDogs = () => {
        getDogs()
        .then((response)=>{
            if(response.error){
            
            }else{
                this.setState({dogs: response})
            }
        })
    }
    - add errors: null to this.state
    - add this.loadDogs()
    - under render
        - const{ errors, dogs} = this.state
    - under return
        - {errors &&
        <div>
            <h3> there is a probl </h3>
            <ul>
                {errors.map((error) => <li>error</li>)}
            </ul>
        </div>
        <ul>
            {dogs.map((dog)=>{
                return(<li>{dog.name} - {dog.enjoys}</li>)
            }})




