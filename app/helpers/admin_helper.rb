helpers  do
	
	def user_types
		user_types = User.select(:type).map(&:type).uniq
	end

end