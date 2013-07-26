
get '/appointments' do
  erb :appointments_book
end

put '/appointments/book' do
  p "did it"
  appointment = Appointment.find(params[:appointment_id])
  appointment.patient = current_user
  appointment.save
end
