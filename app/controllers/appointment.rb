
get '/appointments' do
  erb :appointments_book if 
  redirect '/'
end

put '/appointments/book' do
  appointment = Appointment.find(params[:appointment_id])
  appointment.patient = current_user
  appointment.save
  current_user.appt_count += 1
end
