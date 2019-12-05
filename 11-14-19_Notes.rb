Wildlife Tracker project
https://github.com/learn-academy-2019-echo/Syllabus/blob/master/Rails-M/09rails_wildlife_tracker_challenge.md

after setting up rails, postman, etc
in terminal
    rails new wildlife_tracker -d postgresql -T
    cd wildlife_tracker
    rails db:create
    rails generate resource Animal common_name:string latin_name:string kingdom:string    -> creates all our animal characteristics and their resources MVC
    rails db:migrate
    rails c
    Animal.create(common_name: "deer", latin_name: "Cervidae", kingdom: "mammal")
    Animal.all                                                                          -> shows all the animals, in this case just deer

in controller
    def index
        @animals = Animal.all                                                       -> rendering in json so i can use in postman
        render json: @animals                                                   -> this makes it so the api is interacting in json, allows RESTful object, and allows postman to access it
    end

in terminal
    exit
    rails s
    
in postman
    get -> request
    pass in animals url