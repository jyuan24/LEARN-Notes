Ruby Rails Review

talking about Rails

MVC
Model - business stuff
View
Controller - traffic cop

going through example
in terminal
    rails new Blog -T -d postgresql                     -> creates Blog app using postgresql as database
    
    rails db:create                                     -> 
    rails g model BlogPost title:string content:text publish_date:date              -> creates model BlogPost (can't use same name as app Blog')
    rails db:migrate                                                            -> migrate
    rails c                                                                     -> run rails console
    
    BlogPost.create title: 'You are awesome', content: 'Echo 2019', publish_date: 2.months.from_now         -> creates blog post 2 months from today
    BlogPost.create(title: "Echo > Foxtrot", content: "Just kidding. we love you too.", publish_date: 6.days.from_now)          -> another post 6 days from today
    BlogPost.where(title: "You are awesome").first                                  -> look up blogpost w/ title "You are awesome". w/o .first, it'll return relation, like an array'
    post = BlogPost.where(title: "Your are awesome").first              -> creates post to equal above
    post.content = "something else"                                 -> creates content column and update content of post to be something else
    post.save                                                       -> saves change
    post.update(content: "no doubt")                                -> update content to be no doubt
    exit                                                            -> need to create relationship now between 
    
    rails g model Comment author_name:string content:string
    
in migration
    t.integer :blog_post_id                                                 -> this generates foreign key

in terminal
    rails db:migrate                                                    -> migrates foreign key

in post
    belongs_to :blog_post
    
in blog_post
    has_many :blogs

in terminal
    rails c
    post = BlogPost.first
    post.comments.create(author_name: 'matt', content: 'first comment')
    post.comments
    post.comments.first.content                                             -> returns 'first comment'
    post = BogPost.first
    post.comments << comment                                                -> this shovels in the foreign key id we forgot to add earlier
                                                                            -> look back at 10-30-19 notes for ways to add foreign key
    exit
    rails g controller BlogPosts                                            -> creating model and contents for above
    rm app/helpers/blog_posts   .rb                                         -> not needed files? removing this + another file
    
in BlogPostsController app
    def index
        @posts = BlogPost.all
    end

in view (create index.html.erb file)
    <h1>Blog Posts</h1>
    <ul>
        <% @posts.each do |post| %>                                     -> escapting into ruby in this html file
            <li>
                <%= post.title %>
            </li>
        <% end %>
    </ul>
        
in terminal
    rails routes                                                        -> this shows all server routes available
    
in config -> routes.rb
    get "blog_posts" => "blog_posts#index"                              -> creates route /blog_posts to website, referencing controller name & method index
    root to: 'blog_posts#index'                                         -> makes root page that

in controller.rb
    def show                                                                -> to show 
        @post = BlogPost.find(params[:id])
        render "show.html.erb"

in config -> routes.rb
    get "blog_posts" => "blog_posts#index"                              -> 
    get "blog_posts/:id" => "blog_posts#show"                           -> gets parameter id
    root to: 'blog_posts#index'                                         -> 

create show.htmlerb in views -> create new file called show
    <h1><%= @post.title %></h1>                                         -> allows the post title to show up, in this case "You are awesome"
    <p><%= @post.content %></p>                                         -> shows the content, in this case 
    <ul>
        <% @post.comments.each do |comment| %>
            <li><%= comment.content %> :: by - <%= comment.author_name %></li>
        <% end %>
    </ul>

in config -> routes.rb
    get "blog_posts" => "blog_posts#index"                              -> 
    get "blog_posts/:id" => "blog_posts#show", as: "blog_post"          -> creating hyperlinks to 
    root to: 'blog_posts#index'  

in show.htmlerb in views
    <h1><%= @post.title %></h1>                                
    <p><%= @post.content %></p>    
    
    <div>                                                               -> creates link to 
        <%= link_to post.title, blog_post_path(post) %>
    </div>
    
    <ul>
        <% @post.comments.each do |comment| %>
            <li>
                <%= comment.content %> :: by - <%= comment.author_name %>
            </li>
        <% end %>
    </ul>


----------------------------------------------------------------------

FORMS

https://github.com/learn-academy-2019-echo/Syllabus/blob/master/Rails-C&V/05rails_forms.md
                                                -> we want to build a form to input info that would then be saved to database
front-end validation
back-end validation

need to use get request for new, post request for create

in controller
    def create
    end
    def new
    end

in config -> routes.rb
    get "blog_posts" => "blog_posts#index"                              
    get "blog_posts/new" => "blog_posts#new", as: "new_blog_post"           -> look up 'restful routes' on google to see what #s it can use. important that this is before :id because                                                                             otherwise :id tries to reroute to a #show. 
                                                                                ************Read Rails Routing from the Outside In document*********
    get "blog_posts/:id" => "blog_posts#show", as: "blog_post"          
    post "blog_posts" => "blog_posts#create"
    root to: 'blog_posts#index' 

new.html.erb
    <%= form_with action:"/blog_posts", local: true do %>                         -> was <form action:"/blog_posts", method="post" >, but due to security issues we couldn't get that to                                                                               work'. method is post by default, so not needed
        <label for="title">Title</label>
        <input type="text" name="title" />
        <br />
        <label for="content">Content</label>
        <textarea name="content"></textarea>
        <br />
        <input type="submit" value="Submit" />
    </form>

in index.html.erb
    <h1>Blog Posts</h1>
    <ul>
        <% @posts.each do |post| %>                                   
            <li>
                <%= post.title %>
            </li>
        <% end %>
    </ul>

in controller
    def create
        @post = BlogPost.create(title: params[:title],                               -> this through below. check if post is valid, then creates the post
        content: params[:content])
    end
    if @post.valid?
        redirect_to post
    else
        render action: :new                                 -> this redirects back to new page, example would be if you typed wrong password it just takes you back to the same page
    end                                                                             -> through here
    def new
    end

ADDING DELETE

in controller
    def create
        @post = BlogPost.create(title: params[:title],                               
        content: params[:content])
    end
    if @post.valid?
        redirect_to post
    else
        render action: :new                                 
    end                   
    def delete
        @post = BlogPost.find(params[:id])
        if @post.destroy
            redirect_to blog_posts_path
        else
            redirect_to blog_opst_path(@post)
        end
    def new
    end
    
in config -> routes.rb
    get "blog_posts" => "blog_posts#index"                              
    get "blog_posts/new" => "blog_posts#new", as: "new_blog_post"           
    get "blog_posts/:id" => "blog_posts#show", as: "blog_post"          
    post "blog_posts" => "blog_posts#create"
    
    root to: 'blog_posts#index' 
    
to create blog post             -> 
    - add new and create router
    - add new create controller
    - add form for new action for blog post form (form can be found in slack, similar to notes above)
    - add create controller endpoint 

exercise results
https://github.com/learn-academy-2019-echo/rails-forms-joe-joyce-week-7


---------------------------------------------------------------

creating 

in .html.erb
    <%= form_with @post do |form| %>                            -> let's us do cool things w/ form, such as '
        <%= form.label :title %>                                    -> still have form w/ action as below, but NOW inputs are diffent because of rails magic
        <%= form.text_field :title %>                               -> name is now blog_post[title] in console
        <br />                                                      -> returns something like a hash in the rails c
        <%= form.label :content %>
        <%= form.text_area :content %>
        <br />
        <%= form.submit "Create" %>
    <% end %>

in controller
    def new
        
    end
    
going into strong params...google it!
    https://github.com/learn-academy-2019-echo/Syllabus/blob/master/Rails-M/08rails_strong_parameters.md

in controller
    private
    def blog_post_params
        params.require(:blog_post).permit([title, content stuff])               -> saying must require blog post, otherwise it'll yell at you aka STRONG PARAMS, then allows only title and                                                                         content info'
    end

in 
