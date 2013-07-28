require 'faker'

class ApptTime
	def self.rand_time(to, from=Time.now)
	  Time.at(rand_in_range(from.to_f, to.to_f))
	end

	def self.rand_in_range(from, to)
  	rand * (to - from) + from
	end
end

p DateTime.now

20.times do |num|
	user = Patient.create(
		email: Faker::Internet.email,
		first_name: Faker::Name.first_name,
		last_name: Faker::Name.last_name,
		password: 'password')
	p "user #{num}: #{user}"
end

20.times do |num|
	user = Therapist.create(
		email: Faker::Internet.email,
		first_name: Faker::Name.first_name,
		last_name: Faker::Name.last_name,
		password: 'password')
	p "user #{num}: #{user}"
end

200.times do |num|
	appointment = Appointment.create(
		start_at: ApptTime.rand_time((Date.today + 10).to_time),
		duration: 30,
		patient: Patient.all.sample,
		therapist: Therapist.all.sample
		)
	p "appointment #{num}: #{appointment.inspect}"
end

20.times do |num|
	appointment = Appointment.create(
		start_at: ApptTime.rand_time((Date.today + 10).to_time),
		duration: 30,
		patient: nil,
		therapist: Therapist.all.sample
		)
	p "appointment #{num}: #{appointment.inspect}"
end

20.times do |num|
	user = User.create(
		email: Faker::Internet.email,
		first_name: Faker::Name.first_name,
		last_name: Faker::Name.last_name,
		password: 'password')
	p "user #{num}: #{user}"
end

Patient.create(
		email: "patient@patient.com",
		first_name: Faker::Name.first_name,
		last_name: Faker::Name.last_name,
		password: 'password')

Therapist.create(
		email: "therapist@therapist.com",
		first_name: Faker::Name.first_name,
		last_name: Faker::Name.last_name,
		password: 'password')

Admin.create(
		email: "admin@admin.com",
		first_name: "Bo",
		last_name: "Jangles",
		password: 'password')

# class ApptTime
# 	def self.rand_time(from, to=Time.now)
# 	  Time.at(rand_in_range(from.to_f, to.to_f))
# 	end
# end
