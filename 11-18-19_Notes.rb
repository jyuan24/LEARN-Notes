Routing

https://github.com/learn-academy-2019-echo/Syllabus/blob/master/React_and_Rails_Cat_Tinder/Frontend/04routing-in-react/01-react-router-intro.md
- this page summarized below...basics on setting up the app and the schema of what should be embedded where

what is a Single Page Application?
    - only loading the page ONCE, BUT renders on user side
    - info does not need to make a trip back to the server unless interacting with it
    - most sites at least popular ones are all single page applications
    - 'pages' in react app is nothing more than a component

flow
- data flow is very fast
- html flow is a little slower
- js flow is bigger and even slower
- why do we care? improve user experience
- w/ react native, all the html/js is downloaded from app, so app only deals with the server
    - but that's also why there's always updates, and must update app to get newest html / js

today, going to focus on getting from one component to another within application by clicking on links

- DO NOT use multiple routers, or having nested routers
- DO make sure the <nav> is within <Router>
- for the link, use <Link to= > instead of the <a href = > - has to do with how it renders and loads. makes sites load so much faster
    - keep an eye out for the refresh and stop button on the browser. if the page has to refresh, not good.

<Route path="/" exact component={Home} />    ->             for this, 'exact' is needed to designate exactly / in url, otherwise about and tomato would also include home stuff
<Route path="/about/" component={AboutUs} />
<Route path="/tomato/" component={Tomato} />
                                                            -> an alternative for this is <Switch>. look it up
                                                             -> switch advantage is if you go to page that dne, switch can show an error stating that, whereas other method will not. other method will just show info from home page w/o home at the bottom



getting into Dynamic Routes
https://github.com/learn-academy-2019-echo/Syllabus/blob/master/React_and_Rails_Cat_Tinder/Frontend/04routing-in-react/03-dynamic-routes.md
- if you have tomato page within home, then tomato has additional pages, need the following

in App.js
this.state={
  recipeId: props.match.params.id                   -> in class example, we did tomato: this.props.match.params.name
}

in Tomato.js
this.state={
  recipeId: this.props.match.params.id                   -> in class example, we did tomato: this.props.match.params.name
}


working on following exercises
https://github.com/learn-academy-2019-echo/Syllabus/blob/master/React_and_Rails_Cat_Tinder/Frontend/04routing-in-react/02-portfolio-challenge.md
https://github.com/learn-academy-2019-echo/Syllabus/blob/master/React_and_Rails_Cat_Tinder/Frontend/04routing-in-react/04-recipes-challenge.md




Front End Testing with Jest for the above stuff...
https://github.com/learn-academy-2019-echo/Syllabus/blob/master/React_and_Rails_Cat_Tinder/Frontend/01react_testing_jest_enzyme.md

reviews
- smart components
    - can be tough to test due to dramatic 'side effects'
    - test fetching id from server
        - one test assumes you can fetch id, receive right info, etc. too many side effects
    - need to mock it out and have a strategy on how to tackle testing smart components
- dumb components
    - easy to test, no 'side effects'

test files will end in .test.js
use Enzyme to test...makes life easier than Jest
- enzyme can kinda walk through html info

it('Renders a LEARN welcome', ()=>{
  const app = mount(<App />)
  expect(app.find('p').text()).toEqual('Welcome to LEARN')
})


https://github.com/learn-academy-2019-echo/Syllabus/blob/master/React_and_Rails_Cat_Tinder/Frontend/02react_testing_app_structure.md

https://github.com/learn-academy-2019-echo/Syllabus/blob/master/React_and_Rails_Cat_Tinder/Frontend/03react_testing_interactions.md
- simulates onclick, enzyme, form submissions, inputs



review from dynamic methods:
class Recipe extends Component {
  constructor(props){
    super(props)
  
    this.state={
      recipeId: props.match.params.id
    }
  }
  componentDidUpdate(prevProps){
  

lifecycle methods - something to do with updating props instead of state so it renders quickly
    - need to have this.state section as well as this below section
    if(this.props.match.params.id != prevProps.match.params.id){
      this.setState({recipeId: this.props.match.params.id})
    }

