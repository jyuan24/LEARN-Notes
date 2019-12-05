piecing it all together

browser converts react json to string, api sends json to backend react, react processes request and sends back json, api converts json back to react for user

on js/react side, use FETCH to request ALL HTTP verbs
    - fetch is not just get, it's also post, put, patch, delete'

https://github.com/learn-academy-2019-echo/Syllabus/blob/master/Rails-M/10using_fetch.md

fetch works on promises
    - promises prevents browser from freezing up when waiting for response
    - browser still functional, and will be notified when promise gets back to the browser
      https://medium.com/@mostlyfocusedmike/promises-promises-understanding-the-basics-of-js-promise-objects-dd5c656f2db4
      https://medium.com/@mostlyfocusedmike/i-promise-ill-get-to-it-js-promise-objects-and-asynchronous-events-afdc16951e67
      https://itnext.io/that-data-looks-so-fetching-on-you-understanding-the-js-fetch-api-880eae0c8d25

fetch is built in method, atom may give error saying it doesn't know fetch, you can ignore it'


in App.js (copied from link above)
  getSpiritAnimals = () => {
    fetch("http://<your cloud 9 IP address or localhost>:8080/spirit_animals")
    .then((resp)=>{                                                 -> .then(resp) tells it to convert to json and expect json back
      return resp.json()
    })
    .then((animals)=>{                                              -> this is pulling the json version of request
      this.setState({ spiritAnimals: animals })                     -> sets the state, rerenders and shows the spiritAnimals on the screen
    })
    .catch((error)=>{                                               -> similar to an else in if statements, just to return error to user instead of leave them hanging
      this.setState({ error: `Sorry, there was a problem.  ${error.message}`})
    })
  }
  

CORS - cross origin resource scripting
    - very bad
    - we want to only allow the http verbs from a specific url
    - to get around any issues involving that, need to $ bundle add rack-cors
    - follow instructions in notes and paste block of code into own

to get started
in terminal
    create-react-app wildlife-tracker-frontend

follow example in notes

in AWS, build react in same environment


---------------------------------------------------------------


ACCESSIBILITY TALK
Christopher Land
Level Access

- accessibility
    - catering to disabled
    - examples of digital disabilities
        - blind
            - improve keyboard access
            - screen readers
                - NVDA screen reader free open source example
        - low vision
            - screen readers
            - color contrast
        - color blindness
            - color contrast
            - device/glasses that help with differentiating
        - deafness/hearing loss
            - video captions
        - motor disabilities
            - larger target sizes
            - clearer links
            - fewer tab stops on page, less work to browse around
        - cognitive disabilities - adhd, autism, etc
            - clearer instructions
        - dyslexia/reading disabilities
            - don't animate too many words/images'
            - clear column width and distance between words
        - speech disabilities
        - aging & accessibility

- inclusive design
    - designing to include as many people as possible

- assistive technology
    - item/equipment/software/etc that improve functional capabilities of ppl w/ disabilities

- 1/7 of world (15%) is disabled (includes all sorts of disabilities)

- how do we measure accessibility?
    - see ADA.. although ADA was from 1990 doesn't include digital space'

- W3C standard
    - WCAG (web content accessibility guidelines 2.0/2.1)
    - POUR
        - Perceivable
            - can perceiv content from 1 of 5 senses
        - Operable
            - keyboard functionality
            - give users enough time to read content
            - does not cause seizures
        - Understandable
            - easy to read and simplified text
        - Robust
            - responsive, on as many devices as possible
- testing / things to watch out for
    - use of automated accessibility testing
    - accessibilityinsights.io is one example for visual
    - tabs shift+tabs for keyboard
    - alt text on images for screen readers to read out
    - NoCoffee free browser plugin to simulate color-blindness
    - assessing color contrastness, must be specific ratio, websites exist for color pickers
    - use of good document structure makes it easier for screen readers to follow & navigate
    - form errors should describe what the error is and how to fix it

certifications
    - CPACC - 
    - WAS - web accessibility s
    - with the above 2, you become a CPWA (certified professional web accessibility?)
    
A11YSD.com meetup wed, december 11 - 12-11-19

