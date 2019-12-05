Forms in react

        <div>
          <Header greeting={type=
              name=
          } />
          <button> onClick={}</button>
        </div>
        
        
inputting value will not trigger react to do anything typically...

there's no sort of handleSubmit method, submit button doesn't do anything to the code


-- add handleSubmit = () => {}


add under class App extends React...
        this.state = {
            form: {
                name: ""
            }
        }
        
need to make connection between the this.state{} and the <input>

<input = 
MUST INCLUDE onChange = 
and value = 
>


------------THIS BELOW IS IMPORtANT
class GreetingInput extends Component {
  handleChange = (e) => {
    this.props.updateGreeting(e.target.value) // the e.target.value is super important, allows console to log everything you type in your keyboard as you're typing
  }


