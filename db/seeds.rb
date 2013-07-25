require 'faker'

20.times do |num|
	user = User.create(
		email: Faker::Internet.email,
		first_name: Faker::Name.first_name,
		last_name: Faker::Name.last_name,
		password: 'password')
	p "user #{num}: #{user}"
end

20.times do |num|
	post = Post.create(
		title: Faker::Lorem.words(rand(6)+1).join(' '),
		url: 'https://en.wikipedia.org/wiki/Rickrolling',
		body: Faker::Company.bs,
		user: User.all.sample)
	p "post #{num}: #{post}"
end

100.times do |num|
	comment = Comment.create(
		user: User.all.sample,
		post: Post.all.sample,
		text: Faker::Company.bs
		)
end
