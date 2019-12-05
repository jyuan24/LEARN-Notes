HOW INTERNET WORKS

vocab words
HTTP/HTTPS - method of communication. s is secure, like private conversation
DNS - domain name service. some sort of record that says for example github.com maps to a specific IP address xxx.x.x.x
    request (go to github.com) -> local IP -> universal IP somewhere
    pages not found errors for example are because of some broken communication between the IP addresses
IP address - physical address of a computer

HTTP responses:
- 100s - informational
- 200s - success
- 300s - redirect (the thing you are asking for isn't here)
- 400s - client side error (user fault w/ web address for example)
- 500s - server side error

********CRUD AND HTTP VERBS PROBABLY MOST IMPORTANT THINGS FROM INTERNET LESSON*************
CRUD - basic actions website should be able to do
- C - create
- R - read
- U - update
- D - delete

HTTP verbs...similar to CRUD above
- GET - read, simplest type of request
- POST - create, usually creates
- Put - update/replace
- Patch - update/modify
- Delete - delete
********************************************************************************************

API - application programs interface - process of getting data from a website, returned in JSON. data to data interface. no markups, just generates info. kind of just computers talking to computers.
- one example is facebook. 

Attacks
- man in the middle - most prevented by httpS. accesses network on open wifi
- cross site scripting - embed JS in websites
- DNS cache poisoning - change local IP address so your comp goes to poison site
- DDOS attack - distributed denial of service - bogs down server w/ requests, appears server is down
- IDN homograph attack - changing letter like roman numeral to make url appear normal but is actually different

how encryption kind of works
"salt" value made up by server for example asdf1234
password you use for example thisismypassword1
server will take asdf1234thisismypassword1, then encrypt that with some sort of algorithm into either 32 or 64 bit encryption system (32 or 64 characters)
when you tyep in pw, you send request, system knows which "salt" value was used, find the algorithm in the database, and compare pws.

---------------------------------------------------------------------------------------------------------------------------------------------------

get ready for REACT
going to use:
Array
- map
- forEach
- slice

String
- split
- subString

- Math.random
