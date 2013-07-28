
get '/users/manage' do
	if current_user.type == "Admin"
  	erb :user_management
  else
  	redirect '/'
  end
end