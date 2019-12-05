React PROPS


React renders when:
- state changes
- 





                  - Form     - Input
example ---- App -
                  - Greeting
                  
    in the above, App tells greet and form what to do, never the other way around
                and form and greet are completely independent of each other
                issue: greet and form are completely independent of each other, so how do they communicate w/ each other?
                
                
PROP - allows info to travel back "upstream"
        2 parts 
        1. get the info back up stream
        2. get the info back down stream in the proper branch
        
        
        
from notes:
<GreetPerson name='Bob' /> // this is props

dumb vs smart components
dumb components will never change. for example, "Bob" will never really change and will be used in forms
dumb components are important in getting info from child to parent to child
props contains info that gets passed around

going over ZoltarWisdom.js doc in class...see notes

in React, curly brackets {} are used when calling JS 

