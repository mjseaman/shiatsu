get '/post/:id' do
	p "in post/:id"
	p params[:id]
	self.current_post = Post.find(params[:id].to_i)
	erb :post
end

get '/post/create/' do
	erb :_post_create
end 

post '/post' do
	self.current_post = Post.new(params)
	if current_post.errors.any?
		redirect to('post/create')
	else
		current_post.user = current_user
		current_post.save
		redirect to('/')
	end
end

post '/post/:id/comment' do
	comment = Comment.new(text: params[:text])
	if current_user
		comment.user = current_user
		comment.save
		Post.find(params[:id]).comments << comment
		redirect to("/post/#{params[:id]}")
	else
		redirect to('/sessions/new')
	end
end

