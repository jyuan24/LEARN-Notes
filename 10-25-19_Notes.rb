Agile design

Lean mindset
stemmed from toyota product flow
general idea, deliver small packages of things constantly as opposed to a large package of everything all at once

example from yesterday, running multiple multiple unit tests to test many different small aspects of our code



gem install rspec (from yesterday)

building learn class walk through testing
to explore inheritance more in depth

test file below:

learn_class_spec.rb
require "rspec"
require_relative "learn_class"
describe LearnClass do # matt suggests writing in as Class as opposed to yesterday in quotes because writing in as class gives error saying class doesn't exist, as opposed to the other way in quotes it would just say that feature or something doesn't exist. he says both ways are fine, just writing class name provides more specific error response.
    it "should instantiate wihtout error" do
        expect{LearnClass.new}.to_not raise_error
    end
end

learn_class.rb
class file below:
class LearnClass
end

in terminal, if you type in "rspec learn_class_spec.rb --format documentation" it will provide a whole list of things for your entire code

chart of learn class to illustrate

               is a            __has a [Classroom]
[Institution] ----[Learn]-----|                       ___[Teachers]
                              |__has many-------------|__[Students]
                              
class Institution
end

class LearnClass < Institution # this creates the "is a" relationship like we did yesterday
    def initialize()
        @teachers = [] # this is how to designate a "has many" relationship..."has a" would be designated with just a variable instead of array
    end
end

teacher.rb
class Teacher # here, we don't want an "is a" relationship, need a "has a" relationship
    def initialize(learn_class)
        @learn_class = learn_class # this is a "belongs to" relationship
    end
end

teacher_spec.rb
require "rspec"
require_relative "teacher"
describe Teacher do
    it "should initialize" do
        expect{Teacher.new}.to_not raise_error
    end
end

require "rspec"
require_relative "learn_class"
describe LearnClass do
    it "should instantiate wihtout error" do
        expect{LearnClass.new}.to_not raise_error 
    end
end

teacher_spec.rb
require "rspec"
require_relative "teacher"
describe Teacher do
    it "should initialize" do
        expect{Teacher.new(learn_class)}.to_not raise_error
    end
    it "should belong to a learn class" do 
        learn_class = LearnClass.new
        teacher = Teacher.new(learn_class)
        expect(teacher.learn_class).to eq (learn_class) # this added as described, to check teachers exist in learn class
    end
end # this still fails, because instance variable is not yet defined...need to add to teacher.rb

class Teacher
    def initialize(learn_class)
        @learn_class = learn_class 
    end
    def learn_class # this added to define instance variable, then can be used in test code
        @learn_class
    end
end

require "rspec"
require_relative "teacher"
describe Teacher do
    it "should initialize" do
        expect{Teacher.new(learn_class)}.to_not raise_error
    end
    it "should belong to a learn class" do 
        learn_class = LearnClass.new
        teacher = Teacher.new(learn_class)
        expect(teacher.learn_class).to eq (learn_class)
    end
    it "should be able to assign new learn class" do
        delta = LearnClass.new
        teacher = Teacher.new(delta)
        echo = LearnClass.new
        teacher.learn_class = echo
        expect(teacher.learn_class).to eq(echo) # this would fail at the moment, need to redefine something in teacher.rb to allow this to work
    end
end

class Teacher
    def initialize(learn_class)
        @learn_class = learn_class 
    end
    def learn_class
        @learn_class
    end
    def learn_class= new_class # this is that ruby magic discussed yesterday with color=
        @learn_class = new_class # this block added to be able to redefine learn_class
    end
end

class Teacher
    attr_reader :learn_class # this replaces initial def of learn_class
    attr_writer :learn_class # this replaces redefining of learn_class
    def initialize(learn_class)
        @learn_class = learn_class 
    end
    # def learn_class
    #     @learn_class
    # end
    # def learn_class= new_class
    #     @learn_class = new_class
    # end
end

class Teacher
    attr_accessor :learn_class # this replaces both attr_reader and attr_writer...we know we can use this because both below apply
    # attr_reader :learn_class 
    # attr_writer :learn_class
    def initialize(learn_class)
        @learn_class = learn_class 
    end
end

require "rspec"
require_relative "teacher"
describe Teacher do
    it "should initialize" do
        expect{Teacher.new(learn_class)}.to_not raise_error
    end
    it "should belong to a learn class" do 
        learn_class = LearnClass.new
        teacher = Teacher.new(learn_class)
        expect(teacher.learn_class).to eq (learn_class)
    end
    it "should be able to assign new learn class" do
        delta = LearnClass.new
        teacher = Teacher.new(delta)
        echo = LearnClass.new
        teacher.learn_class = echo
        expect(teacher.learn_class).to eq(echo) 
    end
    it "should have a name" do # this added to test name
        learn_class = LearnClass.new
        teacher = Teacher.new(learn_class, "Sally")
        expect(teacher.name).to eq ('Sally')
    end
end

class Teacher
    attr_accessor :learn_class 
    attr_accessor # added to allow redefining of name like we did with learn_class
    def initialize(learn_class)
        @learn_class = learn_class 
    end
end # this will fail test, because we now need to pass name into argument, now it's only set up to pass just learn_class

require "rspec"
require_relative "teacher"
describe Teacher do
    let(:learn_class){LearnClass.new} # these are used to reduce the code...below commented out code is no longer needed because of these
    let(:teacher){Teacher.new(learn_class, "Sally")}
    it "should initialize" do
        expect{Teacher.new(learn_class)}.to_not raise_error
    end
    it "should belong to a learn class" do 
        # learn_class = LearnClass.new      # no longer needed because of above code
        # teacher = Teacher.new(learn_class)
        expect(teacher.learn_class).to eq(learn_class)
    end
    it "should be able to assign new learn class" do
        delta = LearnClass.new
        teacher = Teacher.new(delta, 'Bob') # added name argument here
        echo = LearnClass.new
        teacher.learn_class = echo
        expect(teacher.learn_class).to eq(echo)  # this in class since learn_class was replaced by echo, above blocks reused "echo". in this scenario, "echo" is kinda a variable just within the scope, so it essentially just gets replaced for each it end test
    end
    it "should have a name" do # this added to test name
        # learn_class = LearnClass.new
        # teacher = Teacher.new(learn_class, "Sally")  # same here, no longer needed
        expect(teacher.name).to eq('Sally')
    end
end

######### starting over with a HAS MANY relationship, BUT with books, authors, etc to clear confusion of the whole class thing

book.rb
book_spec.rb
author.rb
author_spec.rb

author_spec.rb
require "rspec"
require_relative "author"
describe Author do
    it "should be instantiable" do
        expect{Author.new}.to_not raise_error
    end
end

author.rb
class Author
end

book_spec.rb
require "rspec"
require_relative "book"
describe Book do
    it "should be instantiable" do
        expect{Book.new}.to_not raise_error
    end
end

book.rb
class Book
end

now for the logic...## AN AUTHOR HAS MANY BOOKS, BOOK HAS ONE AUTHOR

class Author
    def initialize()
        @ = 
    end # has many books
end

class Book
    # belongs to Author
end

require "rspec"
require_relative "author"
describe Author do
    it "should be instantiable" do
        expect{Author.new}.to_not raise_error
    end
    it "should have books"  # testing this shows as pending, no error, can act kind of like a to do for ppl who see your test to see what you have or haven't done yet
    it "should be able to publish book"
end

require "rspec"
require_relative "author"
describe Author do
    let(:frankenstein){Book.new}
    let(:mary_shelly){Author.new} # these two lines same as previous teacher class example
    it "should be instantiable" do
        expect{Author.new}.to_not raise_error
    end
    it "should have books" do
        expect{mary_shelly.books}.to_not raise_error # this uses curlies because it tests a specific block...still kinda confusing but for example this would return a more specific error than () would return a general error. 
    end
    it "should be able to publish book"
        expect{mary_shelly.books << frankenstein }.to_not raise_error # tried shoveling frankenstein into data...but .books is undefined so have to define that first
    end
end

class Author
    def initialize()
        @books = []
    end # has many books
    def books
        @books
    end
end

class Author
    attr_reader :books # replaces below def books as described earlier
    def initialize()
        @books = []
    end # has many books
    # def books
    #     @books
    # end
end



#### Ruby built-in methods for dates
require "rspec"
require "date"
describe "raising error" do
    it "should be on a date" do
        today = Date.today
        expect(today.to_s).to eq("2019-10-25")
        expect(today.year).to eq(2019)
    end
end









doing challenge together as a class in following link
https://github.com/LEARNAcademy/Syllabus/blob/master/ruby/07rb_tasklist_challenge.md

# Story: As a developer, I can create a Task.

task_spec.rb
require "rspec"
require_relative "task"
describe "Task" do
    it "can be created" do
        expect{Task.do}.to_not raise_error
    end
end

task.rb
class Task
end

# Story: As a developer, I can give a Task a title and retrieve it.

task_spec.rb
require "rspec"
require_relative "task"
describe "Task" do
    it "can be created" do
        a_task = Task.new
        expect{Task.new("take out trash")}.to_not raise_error
    end
    it "can be given a title and can be retrieved" do
        a_task = Task.new("buy groceries")
        expect(a_task.get_title).to eq("buy groceries")
    end
    it "can be retrieved"
end

task.rb
class Task
    def initialize(title)
        @title = title
    end
    def get_title
        @title
    end
end

# Story: As a developer, I can give a Task a description and retrieve it.

task_spec.rb
require "rspec"
require_relative "task"
describe "Task" do
    let(:a_task) {Task.new("buy groceries,", "go to store, buy stuff")}
    it "can be created" do
        # a_task = Task.new
        expect{Task.new("take out trash")}.to_not raise_error
    end
    it "can be given a title and can be retrieved" do
        # a_task = Task.new("buy groceries")
        expect(a_task.title).to eq("buy groceries")
    end
    it "can retrieve a description" do
        # a_task = Task.new("buy groceries", "go to store")
        expect(a_task.description).to eq("go to store, buy stuff")
    end
end

task.rb
class Task
    attr_accessor :title, :description # assignment asks just for reading, didn't ask reassigning, but because the test for accessor passed, then reader and writer both also passed
    def initialize(title, description)
        @title = title
        @description = description
    end
    # def get_title
    #     @title
    # end
    # def get_description
    #     @description
    # end
end

# Story: As a developer, I can mark a Task done.

task_spec.rb
require "rspec"
require_relative "task"
describe "Task" do
    let(:a_task) {Task.new("buy groceries,", "go to store, buy stuff", true)}
    let(:pending_task) {Task.new("buy groceries,", "go to store, buy stuff")}
    it "can be created" do
        expect{Task.new("take out trash")}.to_not raise_error
    end
    it "can be given a title and can be retrieved" do
        expect(a_task.title).to eq("buy groceries")
    end
    it "can retrieve a description" do
        expect(a_task.description).to eq("go to store, buy stuff")
    end
    it "can be marked completed" do
        expect(a_task.completed).to eq(true)
    end
    it "should be initialized as false" do
        expect(pending_task.completed).to eq(false) # idea of this was that it can be set as false initially and is able to be set as false
    end
end

task.rb
class Task
    attr_accessor :title, :description, :completed
    def initialize(title, description, completed=false)
        @title = title
        @description = description
        @completed = completed
    end
end



task_spec.rb
require "rspec"
require_relative "task"
describe "Task" do
    let(:a_task) {Task.new("buy groceries,", "go to store, buy stuff")}
    let(:new_completed_task) {Task.new("buy groceries,", "go to store, buy stuff")}
    it "can be created" do
        expect{Task.new("take out trash")}.to_not raise_error
    end
    it "can be given a title and can be retrieved" do
        expect(a_task.title).to eq("buy groceries")
    end
    it "can retrieve a description" do
        expect(a_task.description).to eq("go to store, buy stuff")
    end
    it "can be marked completed" do
        a_task.finish_task
        expect(a_task.completed).to eq(true)
    end
    it "should be initialized as false" do
        new_completed_task = Task.new("title", "description")
        expect(new_completed_task.completed).to eq(false)
    end
end

task.rb
class Task
    attr_accessor :title, :description, :completed
    def initialize(title, description)
        @title = title
        @description = description
        @completed = false
    end
    def finish_task
        @completed = true
    end
end

# Story: As a developer, when I print a Task that is done, its status is shown.

task_spec.rb
require "rspec"
require_relative "task"
describe "Task" do
    let(:a_task) {Task.new("buy groceries,", "go to store, buy stuff")}
    let(:new_completed_task) {Task.new("buy groceries,", "go to store, buy stuff")}
    it "can be created" do
        expect{Task.new("take out trash")}.to_not raise_error
    end
    it "can be given a title and can be retrieved" do
        expect(a_task.title).to eq("buy groceries")
    end
    it "can retrieve a description" do
        expect(a_task.description).to eq("go to store, buy stuff")
    end
    it "can be marked completed" do
        a_task.finish_task
        expect(a_task.completed).to eq(true)
    end
    it "should be initialized as false" do
        new_completed_task = Task.new("title", "description")
        expect(new_completed_task.completed).to eq(false)
    end
    it "should show status done" do
        a_task.finish_task
        expect(a_task.task_status)).to eq("Finished")
    end
end

task.rb
class Task
    attr_accessor :title, :description, :completed
    def initialize(title, description)
        @title = title
        @description = description
        @completed = false
    end
    def finish_task
        @completed = true
    end
    def task_status
        if @completed == true
            return "Finished"
        else
            return "Not Finished"
        end
    end
end

# Story: As a developer, I can add all of my Tasks to a TaskList. Hint: A TaskList has-many Tasks

task_spec.rb
require "rspec"
require_relative "task"
describe "Task" do
    let(:a_task) {Task.new("buy groceries,", "go to store, buy stuff")}
    let(:new_completed_task) {Task.new("buy groceries,", "go to store, buy stuff")}
    it "can be created" do
        expect{Task.new("take out trash")}.to_not raise_error
    end
    it "can be given a title and can be retrieved" do
        expect(a_task.title).to eq("buy groceries")
    end
    it "can retrieve a description" do
        expect(a_task.description).to eq("go to store, buy stuff")
    end
    it "can be marked completed" do
        a_task.finish_task
        expect(a_task.completed).to eq(true)
    end
    it "should be initialized as false" do
        new_completed_task = Task.new("title", "description")
        expect(new_completed_task.completed).to eq(false)
    end
    it "should show status done" do
        a_task.finish_task
        expect(a_task.task_status).to eq("Finished")
    end
end
describe "Tasklist" do
    it "can create tasklist" do
        expect{Tasklist.new}.to_not raise_error
    end
end

task.rb
class Task
    attr_accessor :title, :description, :completed
    def initialize(title, description)
        @title = title
        @description = description
        @completed = false
    end
    def finish_task
        @completed = true
    end
    def task_status
        if @completed == true
            return "Finished"
        else
            return "Not Finished"
        end
    end
end
class Tasklist
end



task_spec.rb
require "rspec"
require_relative "task"
describe "Task" do
    let(:a_task) {Task.new("buy groceries,", "go to store, buy stuff")}
    let(:pending_task) {Task.new("buy groceries,", "go to store, buy stuff")}
    it "can be created" do
        expect{Task.new("take out trash")}.to_not raise_error
    end
    it "can be given a title and can be retrieved" do
        expect(a_task.title).to eq("buy groceries")
    end
    it "can retrieve a description" do
        expect(a_task.description).to eq("go to store, buy stuff")
    end
    it "can be marked completed" do
        a_task.finish_task
        expect(a_task.completed).to eq(true)
    end
    it "should be initialized as false" do
        new_completed_task = Task.new("title", "description")
        expect(pending_task.completed).to eq(false)
    end
    it "should show status done" do
        a_task.finish_task
        expect(a_task.task_status).to eq("Finished")
    end
end
describe "Tasklist" do
    let(:a_task){Task.new("buy groceries", "go to store, buy stuff")}
    it "can create tasklist" do
        expect{Tasklist.new}.to_not raise_error
    end
    it "adding tasks with push task method works" do
        new_tasklist = Tasklist.new
        expect(new_tasklist.tasks(a_task)).to_not be_nil
    end
    it "has the tasks added to it" do
        new_tasklist = Tasklist.new
        expect(new_tasklist.tasks(a_task).to eq([a_task])
    end
end

task.rb
class Task
    attr_accessor :title, :description, :completed
    def initialize(title, description)
        @title = title
        @description = description
        @completed = false
    end
    def finish_task
        @completed = true
    end
    def task_status
        if @completed == true
            return "Finished"
        else
            return "Not Finished"
        end
    end
end
class Tasklist
    def initialize
        @tasks = []
    end
    def task(individual_task)
        @tasks << individual_task
        @tasks
    end
end

# Story: As a developer with a TaskList, I can get the completed items.

# Story: As a developer with a TaskList, I can get the incomplete items.