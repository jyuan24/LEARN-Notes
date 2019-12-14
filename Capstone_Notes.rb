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
    git remote add heroku https://git.heroku.com/heroku-app-name.git         -> made connection to heroku app, done automatically when heroku create is run, but this is needed when not creating app
git config --list | grep heroku             -> did w/o | grep heroku first
heroku config:set RAILS_MASTER_KEY=<your-master-key>
git pull heroku master                  -> use this when updating heroku
git add .
git commit -m ''
git push heroku master
heroku logs --tail          -> outputs and tracks everything in your terminal
tip: can use heroku run [insert rails commands here] ex heroku run rails db:migrate
see notes for more specifics

when changing heroku name:
in atom 
atom .git/config, then change heroku link manually
in aws
directory settings to show hidden files
.git/config , manually change heroku link then save

------------------------------------------------------------------------------

working with API to load in contacts
process
user login -> get auth code rom linkedin -> get token using auth code -> user can click the contacts they want to add to their app

https://github.com/hexgnu/linkedin/blob/master/EXAMPLES.md


--------------------------------------------------------------------------------

TESTING
notes posted on github: 

RAILS

only test code that you write
    - in this scenario, we don't have to test anything devise related'

rails g rspec:model User            -> can be super useful...will generate model for User in Rspec

bundle add rspec-rails
bundle exec rails g rspec:request todos
bundle exec rspec spec

TDD is ideal, but since our code is already written, we will comment out sections and comment back in as a way to still perform red-green refactor. May help uncover some edge cases that were missed prior.

try to test everything individually
    test model tests in the model
    test controller tests in the controller
    exception is when you're testing feature specs where it tests multiple methods'

insert byebug before end of describe User rspec validation
    user.errors[:name] to see what 
    error will show you what you probably want to test, then you can insert the code into the rspec test to validate that on top of what you already have

request tests and feature tests (below is only request test)
    want requests to return 200 status
    want requests to return list of json users
    
    RSpec.describe "Users", type: :request do
        describe "GET /users" do
            let!(:user){User.create name: 'Bob', email: 'bob@bobber.com'}       -> ! creates the thing in the database immediately
            it "works! (now write some real specs)" do
                get users_path
                expect(response).to have_http_status(200)       -> here you can resplace 200 with :success if you wanted to
                expect(response.status).to eq(200)                  -> these are the same, but can't use :success here'
            end
            it "returns a list of users" do
                get users_path
                users = JSON.parse(response.body)           -> this converts the JSON, stringifies it, then turns it into a ruby hash
                expect(response)........
            end
        end
    end

for post requests, use post users_path instead

rspec spec to run tests

followed this tutorial loosely to build our app...didnt end up using factorygirl/bot
https://www.nascenia.com/ruby-on-rails-application-testing-using-rspec/


JAVASCRIPT

do NOT test a component w/ fetch in it
test dumb components only

if you use expect .toMatchSnapshot()
    it will make sure a set of inputs always matches set of outputs
    snapshots are very easy to set up and very thorough to test


remember to move testing gems into development test in gemfile so it's not available to production'