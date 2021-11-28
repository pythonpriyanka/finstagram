# When a browse request the root of the application
# def add_two_numbers(first_number,second_number)
#    p(first_number+second_number)
#  end
# def humanized_time_ago(time_ago_in_minutes)
#     if time_ago_in_minutes>= 60
#       "#{time_ago_in_minutes / 60} hours ago"
#     else
#       "#{time_ago_in_minutes} minutes ago"
#     end
# end

get '/' do
    # File.read(File.join('app/views', 'index.html'))
    # @finstagram_post_shark = {
    #     username: "sharky_j",
    #     avatar_url: "http://naserca.com/images/sharky_j.jpg",
    #     photo_url: "http://naserca.com/images/shark.jpg",
    #     humanized_time_ago: humanized_time_ago(15),
    #     like_count: 0,
    #     comment_count: 1,
    #     comments: [{
    #     username: "sharky_j",
    #     text: "Out for the long weekend... too embarrassed to show y'all the beach bod!"
    #      }]
    # }
    # @finstagram_post_whale = {
    #     username: "kirk_whalum",
    #     avatar_url: "http://naserca.com/images/kirk_whalum.jpg",
    #     photo_url: "http://naserca.com/images/whale.jpg",
    #     humanized_time_ago: humanized_time_ago(65),
    #     like_count: 0,
    #     comment_count: 1,
    #     comments: [{
    #     username: "kirk_whalum",
    #     text: "#weekendvibes"
    #      }]
    #   }

    # @finstagram_post_marlin = {
    #     username: "marlin_peppa",
    #     avatar_url: "http://naserca.com/images/marlin_peppa.jpg",
    #     photo_url: "http://naserca.com/images/marlin.jpg",
    #     humanized_time_ago: humanized_time_ago(190),
    #     like_count: 0,
    #     comment_count: 1,
    #     comments: [{
    #     username: "marlin_peppa",
    #     text: "lunchtime! ;)"
    #      }]
    #  }
    #     #  add_two_numbers(1,6)
    #     #time_ago = humanized_time_ago(finstagram_post_shark[:humanized_time_ago])
    # #Send the string "Hello World!" to the browser
    # #"Hello world!"

    # # hello_world="HELLO WORLD"
    # # if hello_world=="HELLO WORLD"
    #     # p "done"
    # # else
    #     # Do Other Stuff
    # # end

    # #stop
    # # if time_ago_in_minutes > 60
    #     # "more than an hour"

    # # elsif time_ago_in_minutes == 60
    #     # "an hour"
    # # elsif time_ago_in_minutes <= 1
    #     # "just a moment ago"

    # # else
    #     # "less than an hour"
      
    # # end
    # # if time_ago_in_minutes >= 60
    #     # "#{time_ago_in_minutes / 60} hours ago"
    # #   else
    #     # "#{time_ago_in_minutes} minutes ago"
    # #   end
     
    # #p add_two_numbers(6,10)
    # [@finstagram_post_shark, @finstagram_post_whale, @finstagram_post_marlin].to_s
    # #finstagram_post.to_s
    # @finstagram_posts = [@finstagram_post_shark, @finstagram_post_whale, @finstagram_post_marlin]
    @finstagram_posts = FinstagramPost.order(created_at: :desc)
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

        "User #{username} saved!"

    else
        erb(:signup)
    
    end
end
    