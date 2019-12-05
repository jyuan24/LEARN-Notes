Prototypal Inheritance in JS ( as opposed to classical/archetypal inheritance used in c sharp, python, ruby, etc)

moreso the "whys" and not the "hows"

prototypal inheritance:
- uses less memory
- single-ancestor parent/child hierarchies (as opposed to ruby which may have multi child)
- this method allows child to communicate method immediately between parent
- take a look at powerpoint links on prototypal inheritance for info
- examples are like .sort...it is a method of array and that is one link example....sort knows it should be operated on the array

            [] 
---------------------------------------------------------------------------

Ruby Classes and Inheritance


class Card              # class of Card with a method that defines type of card
  def card_type(type)   # creating new object as a variable
    @type = type        #declaring instance variable here with @, and plugging in 
  end
end
p ace = Card.new        # prints just the creation of the object of card: <Card:.............>
p ace.card_type('ace')  # calling the method will return thte instance variable defined in the method
p ten = Card.new.card_type('ten')   #written w/o parenthesis & chained together

important method "initialize" is similuar to "constructor" used in JS


class Light
    def initialize(type)
        @type = type
        @light_status = 'off'
        

class Lamp < Light  # this creates a child of Lamp from class of Light
    def initialize(brightness)
        super('lamp')  #this line allows output of both parent characteristics AND child characteristics, info gets passed to define type in class Light
        # this line above can also be written as super() to return all inputs in initialize( , , ,)
        # super NEEDS arguments in () if initialize has arguments in (). so for this example 'lamp' is needed because it will fill in placeholder of type
        
p table_lamp = Lamp.new('dim') # this creates new variable called table_lamp which is child class Lamp with 'dim' plugged in to placeholder brightness
p table_lamp.flip_switch # this runs table_lamp through parent function flip_switch and will set the switch to on instead of off

by Sandy Mets author POODR 'practical object oriented design something...' read suggested by matt on inheritance
        

