get '/sessions/new' do
  # Display sign-up/sign-in page
  @user = User.new
  @new_user = User.new
  erb :login
end

post '/sessions' do
  @user = User.find_by_email(params[:email])
  @new_user = User.new

  if @user
    if @user.password == params[:password]
      self.current_user = @user
      redirect to('/')
    else
      @message = "Invalid password"
      erb :login
    end
  else
    @message = "User not found"
    erb :login
  end
end

get '/sessions/logout' do
  logout
  redirect to('/')
end

