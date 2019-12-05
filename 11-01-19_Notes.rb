reviewing tasklist pair challenge from yesterday
https://github.com/rails-routes-controllers-views-joe-lisa/rails-task-list-vc

As a user, I can see a list of all of my TaskLists
console/terminal
    start up rails etc see notes from before
    rails g controller task_list            -> typically main instead of task_list based on past notes, but makes sense that this is specifically our task list controller, this                                            creates task_list_controller file and task_list view folder

task_list_controller.rb
    def index                               -> index is a convention...kinda like a show all like index of a book. kinda a best practice amongst developers for easy read
        @task_lists = TaskList.all          -> notice render line isn't needed here as lisa and i discovered during the exercises yesterday' as long as method name matches
    end

routes.rb
    get '/task_lists' => 'task_list#index'

index.html.erb                                -> create this file in view folder, we will be incorporating ruby into html
    <h1>Task Lists</h1>
    <ul>
        <% @task_lists.each do |task_list| %>                 -> using <% means just ruby action, not rendering anything onto page
            <li>
                <%= task_list.title %>                      -> using <%= means need to render the ruby
            </li>
        <% end %>                               -> this ends the ruby 
    </ul>

task_list_controller.rb
    def show                                            -> also convention like index above
        @task_lists = TaskList.find params[:id]         -> using params to identify which task list we're going to use'
    end

routes.rb
    get '/task_lists/:id' => 'task_list#show'

show.html.erb                           -> create in view
    <h1>Tasks</h1>
    <ul>
        <% @task_lists.tasks.each do |task| %>
            <li>
                <%= task.title %>
            </li>
        <% end %>
    </ul>

at this point, going to /task_lists/1 will show tasks in task list 1, /2 for task list 2, etc.


As a user, I can click on a TaskList

index.html.erb  
    <h1>Task Lists</h1>
    <ul>
        <% @task_lists.each do |task_list| %>  
            <li>
                <%= link_to task_list.title, "/task_lists/#{task_list.id}" %>            -> modifying above line and using string interpolation, link_to is kinda a ruby way of                                                                             doing a href
            </li>
        <% end %> 
    </ul>



As a user, when I click on a Tasklist I go to another page where I can see the name and description of the TaskList



As a user, I can see a list of all the Tasks for a TaskList



As a user, when I click on the Task, I go to another page where I can see the description of the task



As a user, I can navigate back from the the Tasklist page to the list of Tasklist



As a user, when I am on the task I can navigate back to the TaskList



As a user, when I go to the home page (localhost) I can see my list of TaskLists



----------------------------------------

guest speaker Armanda Santana, head of product at Blast Motion

