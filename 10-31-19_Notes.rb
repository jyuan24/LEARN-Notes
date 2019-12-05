front end react

rails view, controller, routes
https://github.com/learn-academy-2019-echo/Syllabus/blob/master/Rails-C&V/01rails_routes_controllers_views.md

working w/ MVC C controller today - in charge of making requests / responses...

review to start rails app
in terminal:
    rails new 'practiceapp' -d postgresql -T
    cd practiceapp
    rails db:create

in the rails config folder, we will be looking at 
    - public folder         -> where things available to the public can be found
    - can create .html files within public folder to create the text
    - for example, create file called hey-echo.html
        add /hey-echo.html to end of rails will take you to that site
    - above is manual way of generating public stuff...there's a way to do it with controller within command'. see below using routes.rb/main_controller.rb

in terminal:
    rails s             -> starts server, like yarn in react
    
in terminal:
    - rails g controller main               -> creates a controller.rb file in app folder and also creates files in view folder
        - main_controller.rb file is a class, can modify it
    - routes.rb file allows us to generate our own site url extensions

in routes.#!/usr/bin/env ruby -wKU          -> found in app/config
    - under do, add get '/greeting' => 'main#greeting'           -> notice get is an http verb, important to use in this case (get, patch, post, delete, put), this also allows /greeting extnsion to bring you to the greeting page. main#greeting is telling the rails to go into the main controller and use the method called greeting, which dne yet

in main_controller.rb
    def greeting                    -> this block will create greeting so the above link can work
        render html: "hello Echo!"          -> link will just show hello Echo! at the top
    end                                                                     -> these steps would create that controller link that will communicate as opposed to the public method above

in routes.rb
    get '/halloween' => 'main#happyhalloween'               -> again, /halloween extension doesn't work yet'.

in main_controller.rb
    def happyhalloween                          -> same as above, /halloween will now show happy halloween friends!
        render html: "Happy Halloween friends!"
    end

note: controller and db have a relationship...if linking to multiple db, likely will need multiple controllers

--------------------------------------

working w/ views now
https://github.com/learn-academy-2019-echo/Syllabus/blob/master/Rails-C&V/02rails_views.md

need to create erb
look for views/main folder
create greeting.html.erb in that main folder    -> this is embedded ruby file and can handle some html as seen below


in controller
    def greeting
        @name = 'Echo Class'
        render 'greeting.html.erb'          -> instead of just rendering html like above, this will now search for that erb file...interesting thing..site still rendered w/o render
                                            -> logic if/else etc can be put in here if wanted
    end

in views/main/greeting.html.erb         -> erb is embedded ruby
    Hello <%= @name %>                  -> how instance variable is passed in
    can also do <h1>Hello <%= @name %></h1>     -> this will put it into header like html
                -> ideally, this stuff will be taken care of by react, and rails would take care of back end, but this practice is full stack rails 
                
in routes.rb
    get
    get
    root to: 'main#greeting'    -> this will allow the main rails page that opens to be the greeting page
    
---------------------------------------------------------

params
https://github.com/learn-academy-2019-echo/Syllabus/blob/master/Rails-C%26V/03rails_params.md

in routes.rb
    get '/greeting/:name' => 'main#greeting'                -> setting up parameter :name, just a way to pass info to our web app in a more dynamic fashion

in main_controller
    def greeting
        @name = params[:name]                   -> saves as instance variable...aka if we don't put anything after greeting/, we'll get an error. if we put greeting/Echo into the browser                                          it will take us to greeting/Echo and the page will display Hello Echo
        render 'greeting.html.erb'
    end                                     -> notice Echo is no longer in the program. typing /greeting/1234 will take you to said page with Hello 1234 at the top, with 1234 as string


example w/ number and if/else logic below adding onto same code above
in routes.rb
    get '/number/:num' => 'main#my_number'

in main_controller
    def my_number
        if params[:num].to_i >= 10              -> needs .to_i otherwise it's comparing string to int'
            @number = 'double digits'
        else
            @number = 'single digit'
        end
        render 'greeting.html.erb'
    end

in greeting.html.erb
    <h2> The number is: <%= @number %></h2>         -> 