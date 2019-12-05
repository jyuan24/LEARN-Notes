flow of props

                                                   _ button
app ______________________________________________|     
^(has a method that can change state of app)      |_ rolls

use of functional prop to pass method to tell button what to send to app


see roulette wheel example
main js just imports button and rolls
button js handles the generating of random number and button onclick
rolls js handles posting of random numbers 


what render does and how it relates to DOM
<div>                               --------
    <div>                           --------- THESE ARE ALL PART OF THE "DOM"                           
        <div>                       ---------
            <p>                     --------
            
virtual DOM will detect what divs / ps etc has changed and will update those specific parts of the screen
processes just in memory, aka it will be super fast
render will allow this to happen