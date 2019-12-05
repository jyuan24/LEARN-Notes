answer key for 
https://github.com/learn-academy-2019-echo/active-record-join-challenges-ben-joe
https://github.com/learn-academy-2019-echo/active-record-join-challenges-ben-joe/blob/answer-key/spec/models/intro_to_sql_specs.rb


running through task stories on
https://github.com/learn-academy-2019-echo/Syllabus/blob/master/Rails-M/03rails_active_record_tasks.md

Story:
As a programmer, I can create a new Task record with a title, which is a string, and description, which is a string.
    to do list of things needed to accomplish this task:
        - new rails app (including db)
        - db (database) modeling 
                                    - Task                  -> this list will grow, but it is the general model for now
                                        - title: String
                                        - description: String
        - migration

in terminal:
    - rails new todo_list -T -d postgresql
    - rails g model Task title:string description:string            -> this generates the model. in our case our model is Task with a title and description as strings. rails will also autocreate a table called tasks. if model was TaskList for example rails would generate table called task_lists
    - rails db:migrate
    - rails c           -> to enter rails console in terminal
    - Task.create ({title:'Be excellent to eachother', description: 'Party on Dude'})           -> can be written w/ or w/o parenthesis or curlies..although this will create an error. no migration yet
    - Task.create ({title:'Be excellent to eachother', description: 'Party on Dude'})
    - Task.create ({title: 'Put them in the Iron Maden', description: 'Excellent'})  -> to add another random title to compile into table
    - exit              -> to exit rails console
    - rails db:migrate  -> this to migrate
    
    
Story: As a programmer, I can list all Task records.
in terminal:
    - Task.all   -> pulls the activerecord
    - Task.all.pluck(:title)        -> pulls only the titles
    

Story: As a programmer, I can set a Task record to done given the ID of the record.
in terminal:
    - rails g migration add_is_done_to_tasks            -> creates migrate file called is_done to tasks
    

in migrate file
    - def change
        add_column :tasks, :is_done, :boolean, default: false       -> tasks plural is important for our code

in terminal:
    - rails db:migrate
    - Task.pluck(:id)       -> returns [1,2] because those are the ids
    - Task.find 1           -> returns all of task id 1 which is the 'be excellent to each other...', also returns is_done: false
    - Task.is_done = true   -> sets is_done to true         -> but not permanently? using some of below stuff to do it??
    - Task.id_done = true   -> this seems wrong...? copied wrong?
    -   some other forms update_attributes(single argument), update_attribute(2 arguments)
        update will update one particular instance, save will save everything
    - task.update_attributes(:is_done, true)        -
    - Task.last.update(is_done: true)               -these two lines to test setting a couple diff tasks as done
    - Task.where(is_done: true)         -> this will return the completed tasks now

to recap above:
in terminal:
    - task = Task.find(1)       -> task is now the first Task
    - task.update(title: "Be excellent to eachother", description: "Party on Dude")
    - task.reload
    

Story: As a programmer, I can list all the records that are done.

Story: As a programmer, I can list all the records that are not done.

Story: As a programmer, I can update the title and description of a Task record given the ID of the record.

in terminal:
    - task = Task.find(1)       -> task is now the first Task
    - task.update(title: "Be excellent to eachother", description: "Party on Dude")
    - task.reload

Story: As a programmer, I can destroy a Task record given the ID of the record.

in terminal:
    - Task.destroy          -> deletes an individual task
    - Task.destroy_all      -> deletes all tasks, clears out the table
    - Task.create title: 'aaa', description: 'ccc'
    - Task.create title: 'bbb', description: 'ddd'      -> creating a couple random tasks to practice again
    - Task.where(title: 'aaa').destroy_all              -> destroys aaa even though it's destroy_all'
    - Task.pluck(:title)        -> returns just bbb stuff

*keep in mind, data created in console do not carry over to other environments ie if pushed/pulled from github
to retain the data, it has to be inserted into seeds.rb
see christi's apartment app example'
    https://github.com/ChristiPWright/Apartment-Search/blob/Christi/db/seeds.rb
    ^ using the above code, you can add data to the seed w/o having to repeat existing data

Story: As a programmer, I can set a Task record with a due date, which is a timestamp.

in terminal:
    - rails g migration add_due_date_to_tasks           -> rails understands the add_due_date_to_tasks as literally add due_date column to tasks table
    - 
in migrate file
    - add_column :tasks, :due_date, :date

in terminal:
    - rails db:migrate
    - rails c

wrong so far, forgot to add time SO

in terminal:
    - rails db:rollback

in migrate file
    - add_column :tasks, :due_date, :date, :time?

in terminal:
    - rails db:migrate
    - rails c
    - Task.first        -> returns dates and timestamp
    - task.update(due_date: 2.days.from_now)
    - task.reload
    to test
    - Task.create title: 'bbb', description: 'ddd'
    - Task.where:("due_date IS NOT NULL")       -returns 'bbb' record, in sql
    - Task.where.not(due_date: nil)             -> same thing as above, but in ruby
    - Task.all.select{|task| !task.due_date.nil?} -> same thing as well             -> are these supposed to answer below question??

Story: As a programmer, I can list all the records with a due date.

-> above section towards bottom under 'to test'?

Story: As a programmer, I can list all the records with a due date today.

in terminal:
    - Task.where("due_date > '#{Date.today.beginning_of_day}' AND due_date < '#{Date.today.end_of_day}'")           -> beg.._ and end_ can be used
    - Task.where(due_date: Date.today.beginning_of_day...Date.today.end_of_day)                                 -> same as above, but easier to write

Story: As a programmer, I can list all the records without a due date.

in terminal:
    - Task.where(due_date: nil)


------------------------------------------------



when trying to relate Task to TaskList
in migrate file:
    add_column :tasks, :task_list_id, :integer              -> this is how to add foreign key to TaskList, saying "adding to tasks table, a column called task_list_id of integers"

in terminal:
    rails db:migrate

in tasklist.rb
    has_many :tasks
    
in task.rb
    belongs_to :task_list

in terminal:
    rails c
    task = Task.last            -> this 
    Task.create title:'testing', description:'this'             -> this doesn't work, id is nil'
    task.valid?             -> this will return false
    task.errors             -> diagnosing

reason why above isn't working is because the higher level TaskList is still blank.'

in terminal:
    list = TaskList.create title: 'echo graduation'
    Task.create title:'everyone understands belongs_to implicit validation', task_list_id: list.id        ->OR task_list: list (kinda shortcut version)-> this creates the association to                                                                                                      list. IMPORTANT id is default name of task_list table id column, so creating                                                                                                       the column called exactly task_list_id is IMPORTANT!!!
    task = Task.last
    task.valid?                     -> now it will return true
    list.tasks
    
again:
in terminal:
    list = TaskList.create title: 'trick-or-treat'
    list.tasks                      -> should return empty cause nothing in it yet
    list.tasks.create title: 'get almond joy'           -> this will add to task and create link

one more way...
in terminal:
    Task.create title:'hersheys cookies and cream', task_list_id: list.id       -> this works too...but matt says not recommended