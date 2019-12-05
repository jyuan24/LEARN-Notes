Adam coming in to talk

diff between language & framework

backbone - one first javascript frameworks to come out. teaches how to build web browser, using jQuery
jQuery 

basically layers of abstraction became          javascript -> jQuery -> Backbone
backbone introduced a way to extract data
    jQuery could for example extract list of user info, but it wasn't easy
    backbone could do thsi easily
    problem was backbone was so small and simple, and was very flexible, but therefore very easy to mess up?

to battle this, google developed chrome which is built off js engine V8, which was way faster than microsoft's browser, and created framework angular to replace use of jQuery and Backbone.
    angular was good, but too complicated for ppl to understand
    thus development of ember (still kinda commonly around) and REACT (predominantly). there were plenty others but these were the more pop ones.
    
Ember was diff in a way that it was a "component architecture". ppl who developed Ember were some of org jQuery developers, so very easy to use, very fast
    - purpose is to work on everything
    - manages back end, browsing, etc
    - Ember is more of a full app architecture, does everything
    
REACT developed by Facebook
    - about building UI, that's it, but does it very well
    
REACT was designed to model around how we think of things...**component by component
FB also introduced virtual DOM
    - DOM = Document Object Model
    - DOM would convert entire screen into raw JS code, and this allowed it to run fast
    - other end of spectrum is read entire screen as HTML and would run much slower by comparison
    - DOM allows framework to determine what changed in its components and ONLY change that one component
    - react constantly scans through components on the screen, and when it detects change, would ONLY change that component instead of changing everything on the screen.
    
diff between library and framework?
    - library could be a framework, basically just a collection of tools created from the language
    
    - components/objects are synonymous. component is a type of object, react just used components to represent the objects
    
language Elixir
    - written in Erling?...function oriented language developed through telecomm world in the 70s, important because if telecomm node dies, you can send signal out to any node and return the same result
    - getting super popular now because of the internet for similar reason
framework Phoenix
    - things over internet would be updated in real time, sends info to many nodes and it would return info so much faster
    
    
diff between object oriented and functional programming
OOB - say you have bike
    - to get bike's material, you may need person.bike.frame.material
    - will be problematic
Functional programming
    - person passes on height, dimensions, metal, function returns bike

from yesterday's exercise,
    - preventDefault
        - typically, browser will try to perform some sort of action when hovering mouse of box, clicking things, etc
        - preventDefault prevents all the default behavior, and tells it what to do instead

in REACt
    - this.state means like this state at the moment that may change in the future
    - 