Promises

fetch goes to grab info in functions
when it comes to asynchronous functions, it can be assigned a 'wait' so it's not going out to retrieve info when requested, but retrieving info right off the bat and holding off on displaying it until requested'
to solve that, add a callback function cb(thing) after the fetch method 
    - cb prevents getting into a thing called 'staircase hell' which would be calling back per feature