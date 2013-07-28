post '/users' do
  @new_user = User.create(email: params[:email],
              password: params[:password],
              first_name: params[:first_name],
              last_name: params[:last_name])

  @user = User.new

  if @new_user.valid?
    self.current_user = @new_user
    redirect to('/')
  else
    erb :login
  end
end

before '/users/:id/*' do
  @user = User.find_by_id(params[:id])
  redirect to('/') if @user.nil?
end

get '/users/:id/profile' do
  @user = User.find_by_id(params[:id])
  erb :profile
end

#user route to update profile
# put 'user/:id/profile/update' do
# #  redirect '/'
#   user = User.find(current_user.id)
# end


get '/users/:id/posts' do
  @user = User.find_by_id(params[:id])
  @posts = @user.posts
  erb :index
end

get '/users/:id/comments' do
  @user = User.find_by_id(params[:id])
  @comments = @user.comments
  erb :comments
end



