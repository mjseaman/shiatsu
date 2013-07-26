helpers do

  def open_appointments
    p "in the open appts helper"
    Appointment.where(patient_id: nil)
  end


end
