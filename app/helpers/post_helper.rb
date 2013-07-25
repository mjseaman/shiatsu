helpers do

  def all_posts
  	Post.all
  end

  def current_post
  	@current_post ||= Post.new
  end

  def current_post=(post)
  	p "In post helper current_post setter"
  	@current_post = post || Post.new
  end

end