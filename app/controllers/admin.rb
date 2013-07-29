
get '/users/manage' do
	if current_user.type == "Admin"
  	erb :user_management
  else
  	redirect '/'
  end
end

put '/user/edit/:id' do
	p "***********************************************"
	user = User.find(params[:id])
	p user
	user.update_attributes(params["user"])
	user.type = params["user"]["type"]
	user.is_active = params["user"]["is_active"] == 'true'
	user.save
	p params
	p user
	redirect '/users/manage'
end
# params[:id]
# .update_attributes
# params[:user]