get '/appointments' do
  redirect '/' if !patient? && !therapist?
  erb :appointments_book 
end

put '/appointments/book' do
  # if 
  if current_user.appt_count < current_user.appt_count_max
    appointment = Appointment.find(params[:appointment_id])
    appointment.patient = current_user
    appointment.save
    current_user.appt_count += 1
    current_user.save
    booked = true
  else
    booked = false
  end
  content_type :json
  {appt_count: current_user.appt_count_max - current_user.appt_count,booked: booked}.to_json
end

put '/appointments/unbook' do
  appointment = Appointment.find(params[:appointment_id])
  appointment.patient = nil
  appointment.save
  current_user.appt_count -= 1
  current_user.save
  content_type :json
  {appt_count: current_user.appt_count_max - current_user.appt_count}.to_json
end

# get '/appointments' do

# end

get '/users/:id/appointments/new' do
  erb :new_appointment_bookings
end

post '/users/:id/appointments' do
  p "these are the params: #{params}"
  @appointments = Appointment.new
  @appointments.parse_time_block(params[:timeblock], params[:id])
  redirect "/users/#{params[:id]}/appointments/show"
end

get '/users/:id/appointments/show' do 
  @appointments = Appointment.find_all_by_therapist_id(params[:id])

  erb :therapist_appointments_show
end

# get '/appointments/:id/edit' do
# end

# put '/appointments/:id' do
# end

delete '/users/:id/appointments/:id' do

  p "these are the params #{params}"
  appointment = Appointment.find(params[:id])
  appointment.delete
end




# GET /photos index display a list of all photos
# GET /photos/new new return an HTML form for creating a new photo
# POST  /photos create  create a new photo
# GET /photos/:id show  display a specific photo
# GET /photos/:id/edit  edit  return an HTML form for editing a photo
# PATCH/PUT /photos/:id update  update a specific photo
# DELETE  /photos/:id destroy delete a specific photo

