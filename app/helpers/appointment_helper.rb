helpers do

  def appointments_on(date, id=nil)
    if id
      Appointment.where('start_date = ? AND therapist_id=?',date, id).order("start_at ASC")
    else
      Appointment.where('start_date = ?',date).order("start_at ASC")
    end
  end

  def distinct_dates
    if current_user.type == "Therapist"
      dates = current_user.appointments.select(:start_date).map(&:start_date).uniq
      dates.select {|date| date >= Date.today }.sort
    else
      dates = Appointment.select(:start_date).map(&:start_date).uniq
      dates.select {|date| date >= Date.today }.sort
    end 
  end

  def appointments_by_day
    if current_user.type == "Therapist"
      distinct_dates.inject([]) { |seed,value| seed << appointments_on(value, current_user.id) }
    else
      distinct_dates.inject([]) { |seed,value| seed << appointments_on(value) }
    end
  end

  def button_class(appointment)
    return "btn-success booked" if appointment.patient == current_user
    return "disabled unavailable" if !!appointment.patient
    "btn-info available"
  end


end
