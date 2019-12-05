Ruby Intro

typing "irb" into terminal will get you into ruby in terminal - good to know how to do but not necessarily the best

- object oriented
- behaves similarly to js in a way that it is compiled on run
- ruby evaluates everything to a truthy value
# to comment
- file extension .rb
- when running in terminal, "ruby filename.rb" instead of "node filename.js"

to print to terminal
- puts ''      -   very much like console.log('')
- print ''     -   similar to console.log(''), but doesn't have a line after it like puts/console.log would
- p ''         -   similar to puts...
'

floats are important now vs integers
example - 5/4 = 1, but 5.0/4 = 1.25

no type cohorsion in ruby..so only things that are falsy are null or false

- only 2 == needed for comparisions

- string interpolation "#{}"

- because everything in ruby are objects, all functions are also methods
    p 'echo19'.capitalize #capitalizes just 1st letter
    p 'echo19'.size #gives length
    
variables
- single = sign
- ruby uses snake_casing suchas
    my_string = 'hello'
    num = 8242947
    my_num = '4920'
    
const in js can be represented with all caps
    p MYCONST = 'hi'
    p MYCONST = 'hello'
    ^ this would give error because MYCONST is already assigned, BUT it would still allow MYCONST to reassign to hello with a warning

parallel assignment
x, y, z = 1, 2, 3 defines x = 1, y = 2, etc
p x, y, z prints out 1, 2, 3

check data types of variables
my_string.class will return string
others will return integer, etc.

change datatype .to_s (to string) and .to_i (to integer)

num.to_s(a number 2-36) will change to a base number, 2 = binary, 16 = hexadecimal
p num.to_s(2).to_i
p 479453.to_s(16)

substrings can be accessed with []
my_string = "hello"
p my_string[3..4] would give "lo"

array methods
won't permanentaly change the variable, but add ! after the method to mutate'
nums = [1,2,3]
p nums.length returns 3
p nums.include?3 returns true
p nums.reverse will return [3,2,1]
BUT p nums.reverse! will still return [3,2,1] and reassigns it to nums

p nums[88] = 7 would return a long array with 7 at index 88 and fill everyting else in between with nil

shovel operator - like .push in js
p [1, 2, 3] << nums will stick nums array into end
p nums << 99 this also mutates
[] << 'hello' returns ['hello']

gets is user input, returns a string
chomp will remove empty chars off end of string. w/o chomp, it will show /n in the result
p your_name = gets.chomp will cut off the end of the input

conditionals if/else/end
if your_age >= 21
    p "#{your_age} blah blah"
else
    p "blah blah"
end

ternary
p your_age <= 21 ? "#{your_age} is old enough" : "#{your_age} is not old enough"

methods def/end
def mult num1, num2
    num1 * num2
end
p mult 3, 7 will return 21

good practice to use parentheses but not required
def mult(num1, num2)
...
p mult(3, 7)

ruby has implicit return, meaning it will automatically return the last line in a loop

if/elsif/else/end
ruby drops e in elsif
p "enter a number"
number1 = gets.chomp.to_i
p "enter another number"
number2 = gets.chomp.to_i
def greater(num1, num2)
    if num1 > num2
        "#{num1} is greater"
    elsif num1 < num2
        "#{num2} is greater"
    else
        "equal"
    end
end
p greater(number1, number2)

unless is kind of a weird if else but flipped..not necessarily super practical in any way
check_num = 6
unless check_num > 5
    p "this"
else
    p "that"
end


hashes
- similar to arrays, uses any object type
=> is called a rocket

lunch_order1 = {tacos: 10, type: "Carnitas"}
p lunch_order1[:tacos] will return 10
#using rocket
lunch_order2 = {'tacos' => 10, 'type' => "Carnitas"}
p lunch_order2['tacos'] will return 10
#using ruby symbol
lunch_order3 = {:tacos => 10, :type => "Carnitas"} #in this case the :tacos is a symbol
p lunch_order3[:tacos] will return 10

hash can also be create with hash.new
burger_order = Hash.new
burger_order['double cheese burg'] = 3
p burger_order returns {"double cheese burg"=>3}
burger_order['veg burg'] = 3
p burger_order returns {"double cheese burg"=>3, "veg burg"=>3}

Loops - do/end
5.times do
    p 'times loop'
end # this will print 'times loop' 5 times

loop_num = 10
loop_num.times do
    p 'hello'
end

i = 0
while i <= 5 do
    p i
    i += 1
end # will return 0 1 2 3 4 5

a = [3,4,17]
a.each do |element| #|| are block code parameters, performs action to each element of array
    p element * 3
end #will return [9,12,51]

MAP
ex_array = [8,9,15,3,12,13]
p ex_array.map{ |i| i * 3 } returns 3* to each element * 3

def mult_number arr
    mult3 = arr.map do |el|
        el * 3
    end
end
p mult_number ex_array #this will return same thing as above just more dynamic. arr and el are just placeholders

can work for names too, say array of names
|value| "#{value} Belcher" would return names w/ last name of belcher added on

new_nums = [8,9,15,3,12,13]
def odd_even arr
    arr.map do |value|
        if value % 2 == 0
            "even"
        else
            "odd"
        end
    end
end
p odd_even new_nums returns [even, odd, odd, odd, even, odd]

def odd_only arr
    arr.select do |value| # other way is to do arr.reject
        value % 2 != 0 # then do % 2 == 0 will give same result
    end
end
p odd_only nums # this will filter out odd only...select is pretty much filter

numArray = [3,5,6,4,6,7,6,6,4,3]
def num_sorter array
    array.uniq.sort
end
p num_sorter numArray # this will return same array w/ all duplicates removed and sorted from least to greatest

my_sentence = 'hello there'
def cap_first sentence
    mapArr = sentence.split.map do
        |value| value.capitalize
    end
    mapArr.join(" ")
end
p cap_first my_sentence returns 'Hello There'

puts my_sentence.split.map(&:capitalize).join(' ') #this returns same exaact thing

no_vowels = "I have no vowels"
def remove_vowel sentence
    sentence.downcase.delete 'aeiou'
end
p remove_vowel no_vowels # this will give back hv n vwls

Spacheship operator
splits array into 2 arrays
nums = Array(1..10)
target = 5
sorter = nums.group_by do
    |n| n <=> target
end
p sorter # this will give back {-1=>[1,2,3,4], 0=>[5], 1=>[6,7,8,9,10]}