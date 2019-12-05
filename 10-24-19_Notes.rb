Testing in Ruby

use RSpec

what is our job as a developer?
- understand specs
- specify end result w/ team before starting
- test code

BDD TDD
- behavior / test driven development - basically the same thing - behavior from users' perspective'

ex:
app that can translate language
main feature - to translate
features include:
 - input box - enter - display
 - choice of language
 - event handler (great thing to test in test-driven development)
 
 test should be written as bare minimum, refactor later, test only what's needed, etc.
 test should be focused on UI to maximize users' experience
 
 

to start working on file, 

both RSpec file and ruby file have to be in the same directory
RSpec file should have _spec.rb
so if car.rb is og file, RSpec file is car_spec.rb

in RSpec, must have 
  require "rspec"
  require_relative "car"
at top to import original file into test file, similar to import in react

to run the test - type
 rspec car_spec.rb 
 into terminal
if rspec wasn't installed yet, it'll prompt you to install, type that into console

gem install rspec needed as well
rspec car_spec.rb to run test

test block in rspec is as follows:

describe "Car" do
 it "has to be real" do # could also be "it can exist" or "this works" as feedback to tester
  expect{Car.new}.to_not raise_error # to_not raise_error is predefined, see below for source of how to find this
 end
end

for more methods like to_not raise_error google "rspec expectations cheat sheet"
 - this addresses everything on the "expect" line in rspec
 
 in the car.rb file to create a file which will pass the test:
class Car
end

running the above will pass test because the class Car exists

next test:

describe "Car" do
 it "has to be real" do 
  expect{Car.new}.to_not raise_error 
 end
 it "has a color, and is a string" do # be as descriptive as possible
  a_car = Car.new # a_car is used to assign Car.new as an object and test the object's parameters. not used above because above test was used to test the class Car not object
  expect(a_car.color).to be_a String
 end
end

important to note on process of testing
- make sure to test first before writing code to make sure it fails
- and to know that the code you are writing is what is causing it to pass

to make above test pass:
class Car
 def initialize
  @color = "cat shoes" # obviously not a color, so let's write a test that will dblcheck if it's a color
  def color # this is needed to be able to call out instance variable in test code, otherwise it would say color is undefined
   @color
  end
 end
end

describe "Car" do
 it "has to be real" do 
  expect{Car.new}.to_not raise_error 
 end
 it "has a color, and is a string" do
  a_car = Car.new
  expect(a_car.color).to be_a String
 end
 it "color is actually a color" do # this will test if the color is actually a color
  colorArray = ["blue", "red", "magenta", "forest green", "champagne", "black", "yellow"] #etc... need an array of colors
  a_car = Car.new
  expect(a_car.color) # 
  a_car.color = "green" #choosing a color not in our array. needs a setter in the car.rb file 
  colorArray.map do |x| # this maps over our color array
   expect(a_car.color).to eq(x) # mapping over array, seeing if we can find "green" in array
  end
 end
end

class Car
 def initialize
  @color = "cat shoes" 
  def color # this is to access instance variable
   @color
  end
  
  def color= (new_color) # this is needed to make the above test work....in order to reset the instance of color. this is some ruby magic. Must have equal sign touching the first color
   @color = new_color # new_color is treated kinda like an argument, but it is still kinda a variable, but used only within this scope
  end
  
 end
end

# this test now returns 3 tests, 1 failure. it expects blue but got green. not running through the array.

describe "Car" do
 it "has to be real" do 
  expect{Car.new}.to_not raise_error 
 end
 it "has a color, and is a string" do
  a_car = Car.new
  expect(a_car.color).to be_a String
 end
 it "color is actually a color" do 
  colorArray = ["blue", "red", "magenta", "forest green", "champagne", "black", "yellow"]
  a_car = Car.new
#  expect(a_car.color) #is this 
#  a_car.color = "green" moving this down within the do
  colorArray.map do |element|
   a_car.color = element # moved down from above. this is reassigning cat shoes to something else that is in the array. not testing cat shoes, not testing user input.
   expect(a_car.color).to eq(element) 
  end
 end
end

the above test now passes, BUT color is still cat shoes, why would the test pass

describe "Car" do
 it "has to be real" do 
  expect{Car.new}.to_not raise_error 
 end
 it "has a color, and is a string" do
  a_car = Car.new
  expect(a_car.color).to be_a String
 end
 it "color is actually a color" do 
  colorArray = ["blue", "red", "magenta", "forest green", "champagne", "black", "yellow"]
  a_car = Car.new
  colorArray.map do |element|
   a_car.color = element 
   expect(a_car.color).to eq(element) 
  end
 end
 
 it "color is cat shoes at first" do # this block of code is to test our initialized values
  a_car = Car.new
  expect(a_car.color).to eq("cat shoes") # to reiterate, it tests that our initial value is "cat shoes", nothing else
 end
 
end
################
# so now, we lost track of the goal...we're testing array is the array, we're not testing "cat shoes" is a color...rewriting below
##################
class Car
 
 COLORS = ["blue", "red", "magenta", "forest green", "champagne", "black", "yellow"] # this removed from test code, added to rb code. this tells it what's allowable.
 
 def initialize
  @color = "cat shoes" 
  def color
   @color
  end
  def color= (new_color)
   @color = new_color 
  end
 end
end

describe "Car" do
 it "has to be real" do 
  expect{Car.new}.to_not raise_error 
 end
 it "has a color, and is a string" do
  a_car = Car.new
  expect(a_car.color).to be_a String
 end
 it "color is actually a color" do 
#  colorArray = ["blue", "red", "magenta", "forest green", "champagne", "black", "yellow"] # this is reassigned as COLORS in the code file
  a_car = Car.new
#  colorArray.map do |element| # this removed and changed to below
  Car::COLORS.map do |element| # this will now check if a color you're testing exists in the array
   a_car.color = element 
   expect(a_car.color).to eq(element) 
  end
 end
 it "color is color at first" do # changed cat shoes to color because it is making sure the initial value is a color of class array
  a_car = Car.new
  expect(a_car.color).to eq(Car::COLORS.first) # changed "cat shoes" to Car::COLORS.first. needs to also change in code
 end
 
 it "color cannot be cat shoes" do
  a_car = Car.new
  expect{
   a_car.color = "cat shoes"
  }.to raise_error("Error - that's not a color") # this added so the test knows what to expect
 end
 
end

class Car
 COLORS = ["blue", "red", "magenta", "forest green", "champagne", "black", "yellow"] 
 def initialize
  @color = Car::COLORS.first # changed from "cat shoes" to Car::COLORS
  def color
   @color
  end
  def color= (new_color)
#   @color = new_color # moved down. 
   if new_color=="cat shoes"
    raise Exception.new("Error - that's not a color")  # this if block added, will raise an error
  end
  @color = new_color # this moved down from above because
 end
end

# this above works now for instance of "cat shoes", but now we want to make it more generalized to include other cases

class Car
 COLORS = ["blue", "red", "magenta", "forest green", "champagne", "black", "yellow"] 
 def initialize
  @color = Car::COLORS.first
  def color
   @color
  end
  def color= (new_color)
   if !Car::COLORS.include?(new_color) # this added to increase test coverage
#   if new_color=="cat shoes" removing this to increase test coverage
    raise Exception.new("Error - that's not a color") 
  end
  @color = new_color 
 end
end

describe "Car" do
 it "has to be real" do 
  expect{Car.new}.to_not raise_error 
 end
 it "has a color, and is a string" do
  a_car = Car.new
  expect(a_car.color).to be_a String
 end
 it "color is actually a color" do 
  a_car = Car.new
  Car::COLORS.map do |element|
   a_car.color = element 
   expect(a_car.color).to eq(element) 
  end
 end
 it "color is color at first" do
  a_car = Car.new
  expect(a_car.color).to eq(Car::COLORS.first) 
 end
 it "color cannot be cat shoes" do
  a_car = Car.new
  expect{
   a_car.color = "cat shoes"
  }.to raise_error("Error - that's not a color") 
 end
 
  it "color cannot be dog boots" do # this block added to test multiple cases. so now if test is run, we know it will fail if not in class array of colors.
  a_car = Car.new
  expect{
   a_car.color = "dog boots"
  }.to raise_error("Error - that's not a color") 
 end
 
end

##### CODE ABOVE NOW ANALYZES ANYTHING YOU WRITE IN YOUR TEST LIKE CAT SHOES OR DOG BOOTS, BUT IT WILL STILL NOT ASSESS USER INPUT, NOT WRITTEN IN YET


#below slightly refactored
class Car
 COLORS = ["blue", "red", "magenta", "forest green", "champagne", "black", "yellow"] 
 attr_reader :color # this added to give ability to get to the element
 def initialize
  @color = Car::COLORS.first
  # def color # these removed and replaced by attr
  #  @color
  # end
  def color= (new_color)
   if !Car::COLORS.include?(new_color)
    raise Exception.new("Error - that's not a color") 
  end
  @color = new_color 
 end
end

describe "Car" do
 it "has to be real" do 
  expect{Car.new}.to_not raise_error 
 end
 it "has a color, and is a string" do
  a_car = Car.new
  expect(a_car.color).to be_a String
 end
 it "color is actually a color" do 
  a_car = Car.new
  Car::COLORS.map do |element|
   a_car.color = element 
   expect(a_car.color).to eq(element) 
  end
 end
 it "color is color at first" do
  a_car = Car.new
  expect(a_car.color).to eq(Car::COLORS.first) 
 end
 it "color cannot be cat shoes" do
  a_car = Car.new
  expect{
   a_car.color = "cat shoes"
  }.to raise_error("Error - that's not a color") 
 end
  it "color cannot be dog boots" do 
  a_car = Car.new
  expect{
   a_car.color = "dog boots"
  }.to raise_error("Error - that's not a color") 
 end
 
 it "car should have a door" do # adding a test for a car door while we refactor the test file
  a_car = Car.new
  expect(a_car.door).to eq(4)
 end
 
end

class Car
 COLORS = ["blue", "red", "magenta", "forest green", "champagne", "black", "yellow"] 
 attr_reader :color, :door # :door added to analyze @door
 def initialize
  @color = Car::COLORS.first
  @door = 4 # this added to analyze # of doors
  def color= (new_color)
   if !Car::COLORS.include?(new_color)
    raise Exception.new("Error - that's not a color") 
  end
  @color = new_color 
 end
end












################################################## CJ TALK ABOUT DATA ENGINEERING

what is a data engineer?
aka machine learning eng, data scientist, big data eng, etc

data engineers are software eng who design, build, integrate => manage big data

~1/3 sql/data analysis
~1/3 programming
~1/3 design/meetings

SQL, Scala, Python all good languages to know

NoSQL also very important - very good for big data
"Not Only SQL"

becoming data eng
- mid level roles
- cj enrolled in Udacity data eng program
- lots of staying ahead of curve
 - read articles, complete side projects, etc
- obtain domain knowledge needed to understand how data elements relate

important skills
- pair/mob programming, esp w/ senior data eng
- unit tests
 - 
- 5 minute tech talks
 - 
- having industry knowledge

- learn Python
 - learn in functional program, oob not nec
 - learn sql
 - obtain certification through aws, google cloud, etc
 - express interest as data analyst
 - complete side projects
 
sources
reddit r/dataengineering
data eng weekly
medium
o'reilly's design data-intensive applications book
- "must have" for data eng