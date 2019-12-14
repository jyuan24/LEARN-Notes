REDUX!!!
following along in attached
https://medium.com/javascript-in-plain-english/the-only-introduction-to-redux-and-react-redux-youll-ever-need-8ce5da9e53c6

in react, if communicating between deeply nested children of different parents, communication can be tough because has to go up states then back down states of correct parent
redux and mobx etc help deal with these

redux process of managin state
- action (user action)
- reducer
- store (gets updated from reducer)
    - store gets updated
        - ex notes gets pulled from store, then gets rerendered and pushed back to store all in one block of code
    - store will contain arrays of json objects
    - dispatch (from redux library) used to update store
- UI
    - UI gets updated
    - dispatches the changes
- action
etc
in a way, it is almost like a 3rd party store outside the state tree which will communicate between the children



--------------------------------------------------------------------------------



learning "agile" (adj)

not to be confused with noun Agile which are things such as scrum, kanban, xp, etc

agile - flexible, fast-paced, adjust easily, iteration, parallel work, mvp

tips:
if a task or story is very unknown, try to break it down into smaller more known tasks
these stories/tasks can be combined into an epic

--------------------------------------------------------------------------------

Tech Talk Tips

rated on performance and technicality
- make sure to define technical words
- each pointer is pretty much a point deducted from 10
- reiterate things that you said prior to help audience remember
