helpers do
    def current_user
      User.find_by(id: session[:user_id])
    end
end

get '/' do
    
    @finstagram_posts = FinstagramPost.order(created_at: :desc)
    # @current_user = User.find_by(id: session[:user_id])
    erb(:index)
end
get '/signup' do
    @user=User.new
    erb(:signup)
end
post '/signup' do
  email      = params[:email]
  avatar_url = params[:avatar_url]
  username   = params[:username]
  password   = params[:password]

#   if email.present? && avatar_url.present? && username.present? && password.present?

    @user = User.new({ email: email, avatar_url: avatar_url, username: username, password: password })
    if @user.save
        redirect to('/login')

        # "User #{username} saved!"

    else
        erb(:signup)
    
    end
end
get '/login' do    
    erb(:login)      
end
post '/login' do    
    username = params[:username]
    password = params[:password]
    @user = User.find_by(username: username)
    if @user && @user.password == password
        session[:user_id] = @user.id
        redirect to('/')
        # "Success! User with id #{session[:user_id]} is logged in!" 
    else
        @error_message = "Login failed."
        erb(:login)
    end
    # params.to_s      
end
get '/logout' do
    session[:user_id] = nil
    redirect to('/')
    # "Logout successful!"
end
get '/finstagram_posts/new' do
    @finstagram_post = FinstagramPost.new
    erb(:"finstagram_posts/new")
end
post '/finstagram_posts' do
    photo_url = params[:photo_url]
    @finstagram_post = FinstagramPost.new({ photo_url: photo_url,user_id: current_user.id})
    if @finstagram_post.save
        redirect(to('/'))
      else
        erb(:"finstagram_posts/new")
        # @finstagram_post.errors.full_messages.inspect
    end
    # params.to_s
end
get '/finstagram_posts/:id' do
    @finstagram_post = FinstagramPost.find(params[:id])
    erb(:"finstagram_posts/show")  
    # escape_html @finstagram_post.inspect  
end

    