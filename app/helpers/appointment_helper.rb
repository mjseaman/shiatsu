helpers do

  def appointments_on(date)
    Appointment.where('start_date = ?',date).order("start_at ASC")
  end

  def distinct_dates
    dates = Appointment.select(:start_date).map(&:start_date).uniq
    dates.select {|date| date >= Date.today }.sort
  end

  def appointments_by_day
    distinct_dates.inject([]) { |seed,value| seed << appointments_on(value) }
  end

  def button_class(appointment)
    return "btn-success booked" if appointment.patient == current_user
    return "disabled unavailable" if !!appointment.patient
    "btn-info available"
  end

end
