CREATING OAUTH FOR APP

follow steps on https://web-crunch.com/sign-in-with-twitter-using-devise-omniauth-ruby-on-rails/

gem files needed are 
    oauth
    oauth2
set up credentials using editor
EDITOR= nano to use nano as the editor
    - where to set up encryption codes acquired from linkedin

create omniauth.rb in config -> initializers
follow these steps
https://github.com/decioferreira/omniauth-linkedin-oauth2

did not use user_{provider} stuff in web-crunch link

add controllers file for devise_for :users, controllers: { this is basically saying go to '' file}
create omnia controllers in app -> controllers -> users -> omniauth_callbacks_controller.rb name of how it was set up

add self.from_omniauth block to app/models/user.rb file
current state has email & pw, can add username etc if you wish

views -> devise -> sessions -> new.html.erb is the login page (created from rails g devise:views)
    add web-crunch block to this file

views -> devise -> shared -> _links.html.erb
    update .omniauthable? linkedin link user_linkedin_omniauth_authorize_path

in routes.rb
    get '/auth/:provider/callback', to: 'sessions#create'
    devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }


--------------------------------------------------------------------------------

ACCESSING CONTACT INFO THROUGH API

authorization works now...but unable to acquire profile info
in order to access profile, need linkedin access token for it
access token not provided when logging in...
access token is the super long extension on the URL
the code='' is our auth token
    recall users/:id 
    this is similar except params[:code] in omniauth_callbacks_controller.rb
need to exchange auth token for access code, 
    need http post request?
add fields criteria to omniauth.rb
    scope=r_basicprofile
    then we'll run into error stating not enough permissions'

following this link https://medium.com/@ellesmuse/how-to-get-a-linkedin-access-token-a53f9b62f0ce
    need to access the access token in postman
    add scope to get request in postmates
    add code to post request in postmates
    get to get authorization code
    post to use authorization code
    json in response is the answer

using HTTParty gem


to be able to clone and start rails in another environment, need to create a new file called master.key and paste our unique key into it 209acb8bfda011ff8268c058f56c980a

-----------------------------------------

DEPLOYING HEROKU

https://github.com/learn-academy-2019-echo/Syllabus/tree/master/heroku

sign up for heroku

working from master branch:

sudo snap install --classic heroku          -> installs heroku into app
heroku login -i
heroku create
git config --list | grep heroku             -> did w/o | grep heroku first
see notes for more specifics


------------------------------------------------------------------------------

working with API to load in contacts
process
user login -> get auth code rom linkedin -> get token using auth code -> user can click the contacts they want to add to their app

https://github.com/hexgnu/linkedin/blob/master/EXAMPLES.md
