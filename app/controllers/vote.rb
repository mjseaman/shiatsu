post '/post/:id/upvote' do
	current_user.post_votes.create(post_id: params[:id])
	content_type :json
	{}.to_json
end

post '/comment/:id/upvote' do
	current_user.comment_votes.create(comment_id: params[:id])
	content_type :json
	{}.to_json
end

delete '/post/:id/upvote' do
	current_user.post_votes.find_by_post_id(params[:id]).destroy
	content_type :json
	{}.to_json
end

delete '/comment/:id/upvote' do
	current_user.comment_votes.find_by_comment_id(params[:id]).destroy
	content_type :json
	{}.to_json
end