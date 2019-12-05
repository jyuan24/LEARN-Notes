Authorization
https://github.com/learn-academy-2019-echo/Syllabus/blob/master/React_in_Rails_Apartment_App/01-react-in-rails/README.md

- look at authentication vs authorization, know the diff

building react app inside rails app
- pros
    - rails very good at packaging all the js, etc, inside the app
    - authentication becomes easier
        - logging into rails logs you into react and as a result don't have to deal with all the CORS stuff'

- authentication in general is tricky and tough
    - likely won't be asked to do it as a new junior dev'
    - destroys companies if it goes poorly

- acc to matt, Devise is a gem used to integrate w/ fb login or whatever login there is
    - believes it to be the future in authentication, used in 90% cases

arvin's notes'    
https://www.evernote.com/shard/s381/client/snv?noteGuid=d3ad4bf2-8aed-48a4-84a5-cd57db1d68d4&noteKey=45f9409a17e8d51d&sn=https%3A%2F%2Fwww.evernote.com%2Fshard%2Fs381%2Fsh%2Fd3ad4bf2-8aed-48a4-84a5-cd57db1d68d4%2F45f9409a17e8d51d&title=Devise%2BLecture%2Bnotes

user log in process
- log in button -> Devise sign in sessions page -> redirect back to home while recognizing user is signed in a displays it (back to react)
- all part of 'cookie management'

to set up:
https://github.com/learn-academy-2019-echo/Syllabus/blob/master/React_in_Rails_Apartment_App/01-react-in-rails/02_Hello_World.md
in terminal
    bundler add react-rails
    bundle install
    rails webpacker:install
    rails webpacker:install:react
    rails generate react:install
    continue following notes instructions
    for AWS, need to change config file because server is through amazon not local
    
ruby hash in .html.erb file then becomes a prop to be called from .js file {this.props.   }
example
    index.html.erb
        <%= react_component("HelloWorld", {learn_class: @learn_class} ) %>
    HelloWorld.js
        within render return:
        <React.Fragment>
            <h1>Hello { this.props.learn_class }</h1>
        </React.Fragment>

what makes rails great?
- active record
- devise
    - controller/helper methods that protects pages from being used when not logged in
    - has ability to reset password, but also set the reset pw time so you cant reset multiple times within that timeframe
    - has ability to check remember me checkbox to save their login
    - has ability to also authenticate name along with emails etc
    - has ability to track number of logins, confirmation emails, lock accounts after x tries

to set up devise:
https://github.com/learn-academy-2019-echo/Syllabus/blob/master/React_in_Rails_Apartment_App/02-authorization-and-authentication/README.md
https://github.com/learn-academy-2019-echo/Syllabus/blob/master/React_in_Rails_Apartment_App/03_devise_and_react_together.md

make sure to have the before_action :authenticate stuff 

follow along with notes
follow instructions and guide in config -> environments -> development ??
    or guide is in terminal after one of the steps?

key thing to note is react and rails might 'fight' over tasks
this block of code tells react to take care of the html stuff
       1	Rails.application.routes.draw do
       2          devise_for :users
       3	  get '*path', to: 'pages#root', constraints: ->(request){ request.format.html? }
       4	  root to: 'pages#root'
       5	end

