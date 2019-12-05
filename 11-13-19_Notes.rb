Creating a full stack rails app

strong params and active record

assuming rails exists, have the app from yesterday w/ blog post which can submit blog posts and link to main page etc:

in controller
    def create                      -> this blog should not flexible at all...we want to require the user to submit content and title
                                        that's why in this case we need strong params to force users to conform to requirements'
        @post = BlogPost.new(
            title: params[:title],
            content: params[:content]
        )

strong params will constrain the SHAPE of the request/data submitted
    ex blog must have title and content
validations constrain the DATA itself
    ex blog must have stuff within title and content

in controller
    def new
        @post = BlogPost.new
    end

in view

old blog post below, restructuring to following
    # <h1>Add a Blog Post</h1>
    
    # <%= form_with url: "/blog_posts", local: true do %>
    #   <label for="title">Title</label>
    #   <input type="text" name="title" />
    #   <br />
    #   <label for="content">Content</label>
    #   <textarea name="content"></textarea>
    
    #   <br />
    #   <input type="submit" value="Submit" />
    # <% end %>

    <%= form_with model: @post, local: true do |form| %>                    -> replaces the entire form block from before, point is to remove literals and allows us to work with objects
        <%= form.label :title %>
        <%= form.text_input :title %>
        <br />
        <%= form.label :content %>
        <%= form.text_area :content %>                                   -> see 'rails form helpers' for guides on how to build this form, we want to use form. not the _tag stuff
        <br />
        <%= form.submit :create %>
    <% end %>

    with this, if you inspect the page, you'll notice the features like blog post now appear to be almost like an array'



in controller
    def create                      -> 
        @post = BlogPost.new(
            title: params[:title],
            content: params[:content]                               -> might want to try :blog_post instead of :content, but you'll see it shows up as a forbidden attributes, which then                                                           leads to seeing something about strong params'
        )

in controller
    def create       
        sanitized_params = params                               -> this block allows us to see same thing on front end while simplifying code
            .require(:blog_post)
            .permit([:title, :content])
        @post = BlogPost.new(sanitized_params)
            # title: params[:title],
            # content: params[:content]                               
        )

in controller
    def create                                                -> to make it even better, add this to bottom of controller, which then changes the controller to the following
        # blog_post_params = params                               -> 
            # .require(:blog_post)
            # .permit([:title, :content])
        @post = BlogPost.new(blog_post_params)
        )

    private                                                       
    def blog_post_params
        params                                              -> method from ApplicationController
            .require(:blog_post)                                    -> requires the shape to look like this
            .permit([:title, :content])                             -> allows title and content but does not require it
    end
    

above is strong params, now for validations!



example, we want post to be at least 5 characters long, if not , we return a message saying why
these go under validations

Validations
https://github.com/learn-academy-2019-echo/Syllabus/blob/master/Rails-M/07rails_activerecord_validations.md
    - set up rules
    - show errors when rules are broken

google 'active record validations'
- some validations that amight apply to our situation is presence and length

in blog_post.rb
    has_many :comments                                              => already existed
    validates :title, presence: true, length: {minimum: 5}          -> validation using the above validations
    }

test in console
in terminal
    rails c
    p = BlogPost.create(content: "it's not valid")          -> returns aerrors
    p.errors.any?                                       -> returns true
    p.valid?                                            -returns false
    p.errors.full_messages                                  -> returns "title can't be blank, title is too short (min 5 characters)"
    p.errors                                                -> shows more details on what possible errors there are


in forms
    <%= form_with model: @post, local: true do |form| %>
        <% if @post.errors.any? %>                                         -> this block returns error 
            <div style = "background-color: red">
                <h2>there is a problem, please correct and resubmit</h2>
                <ul>
                    <% @post.errors.full_messages.each do |error| %>
                        <li><%= error %></li>
                    <% end %>
                </ul>
            </div>
        <% end %>
        <%= form.label :title %>
        <%= form.text_input :title %>
        <br />
        <%= form.label :content %>
        <%= form.text_area :content %>                               
        <br />
        <%= form.submit :create %>
    <% end %>
    
notes in 
https://github.com/LEARNAcademy/form_practice



Building out an API
https://github.com/learn-academy-2019-echo/Syllabus/blob/master/tools_and_resources/postman.md


will be using JSON

use of tool called "postman" json viewer
finder -> applications -> postman 

there are ways to do it in AWS, look in syllabus
https://github.com/learn-academy-2019-echo/Syllabus/blob/master/tools_and_resources/postman.md

using postman, if you GET the localhost link, it'll return the HTML back'
    even when selecting JSON as return, it still doesn't give json back, that's why we're going over these steps'

in controller
    def show
        @post = BlogPost.find(params[:id])
        render json: @post                              -> adding this line to show will allow postman to return in JSON
    end

in postman
    set to post, link to /blog_post/ /13.JSON
        insert JSON block into postman


when in the server - we want to talk in ruby hashes, no JSONs
when in the internet - we want to talk in strings
when in the browser - we want to talk in JSON
whole process is kinda like converting JSON -> strings -> hashes -> strings -> JSON -> etc

postman takes place of browser and shows all the JSON to you
JSON takes the place of the views

postman good for building up backend of application to visualize database w/o having to do it in the view



4 parts of html request
    1. verb
    2. url
    3. body learned about this today, has string which has JSON, but rails doesn't know what the string is until we tell it what the string is', and what request we want back
    4. headers -> this will solve the issue for step 3 - pass authentication, content type

in postman
    headers -> key: content type, value: application/javascript                                     -> tells it the body will be javascript/json
    
    refresher                                       -> these were all ways we were rendering to the API before
    render "show.html.erb"
    render json: @post, status: 400
    render json: @post.errors, status: 422

https://github.com/learn-academy-2019-echo/Syllabus/blob/master/Rails-M/05rails_generate_resource.md

in terminal
    rails g resource Guitar model:string year:integer              -> generates a bunch of things for guitar, like migration, model, controller, view file, resource files
        gonna delete helper and .scss, which are for static websites
        this builds all the routes, all the work we just did EXCEPT for the controller and the 


when it comes to testing, look up "rspec feature" to look into feature specs
    :type => :feature
        visit "/..../..."
    eexpect()

in console
    rspec spec

either feature or controller spec
    rails g rspec:feature guitar_crud
    rspec spec
    rails db:migrate RAILS_ENV=test
    rspec spec

in spec->features
    RSpec.describe "GuitarCruds", type: :request do
        # describe "Index" do
            it "should respond with a list of guitars" do
                headers = { "CONTENT_TYPE" => "application/json" }
                get "/guitars"
                guitars = JSON.parse(response.body)
            end
        # end
    end

in terminal
    mv spec/features spec/requests                  -> moves spec from feature to request
    rspec spec/requests                             -> this should return no syntax error, but say there's no index in the guitars controller which makes sense. we never set it yet.'

in guitarcontroller
    def index
        guitars = Guitar.all
        render json: guitars
    end

in guitar spec
    let!(:guitar){Guitar.create(model: "Fedner", year: 1969)}           -> ! is SUPER IMPORTANT, let is a 'lazy' method and doesn't run unless we call it. ! changes that'
    expect(guitars.first["model"]).to eq("Fender")
    expect(guitars.first["year"]).to eq(1969)

in guitar spec to test a create method now
    it "should create a guitar" do
        headers = { "ACCEPT" => "application/json" }
        # body = { "guitar" => {                        -> old school method
        #     "year" => 1962,
        #     "model" => "Gibson"
        # }}
        body = { guitar: {                              -> new school method
            year: 1962,
            model: "Gibson"
        }}
        post guitars_path, body, headers                                  -> guitars_path defined above, passing body in, then the headers
        expect(response.status).to eq(201)                                  -> expectations 
        parsed_response = JSON.parse(response.body)                         -> writing the expectation to receive back the json
        expect(parsed_response['year']).to eq(1962)
    end
    
in controller
    render json: guitar, status: 201
    
    private
    def guitar_params
        params.require(:guitar).permit(:model, :year)
    end

in guitar.rb
    validates                                                               -> so we cna't submit guitar w/o year and '

in rspec
    it "should show us errors without year" do
        headers = { "ACCEPT"
        expect(response.status).to eq(422)
        
https://github.com/learn-academy-2019-echo/Syllabus/blob/master/Rails-M/additional-topics/07rails_cloud9_access.md

