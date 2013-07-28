class Patient < User
  has_many :appointments

  def reset_appt_count_max
    appt_count_max = 2
  end
  
end
