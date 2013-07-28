class Appointment < ActiveRecord::Base
  belongs_to :patient
  belongs_to :therapist
  has_many :ratings

  before_validation :set_date 

  validates_presence_of :duration
  validates_presence_of :start_at
  validates_presence_of :therapist
  validates_uniqueness_of :start_at

  def set_date
    self.start_date = start_at.to_date
  end

  def parse_time_block(timeblock, id)
    
    timeblock.each do |block|
      p block
      start_datetime = parse_datetime(block['date'], block['start_at'])
      end_datetime = parse_datetime(block['date'], block['end_at'])
      duration_seconds = block['duration'].to_i * 60 

      # loop through and create appointments
      while start_datetime <= (end_datetime - duration_seconds)
        create_appt({therapist_id: id.to_i, start_at: start_datetime, duration: block['duration']})
        start_datetime += duration_seconds
      end
    end

  end

  def parse_datetime(date, time)
    Time.new(date.slice(0..3).to_i, date.slice(5..6).to_i, date.slice(8..9).to_i, time.slice(0..1).to_i, time.slice(3..4).to_i)
  end

  def create_appt(appt_data)
    Appointment.create(appt_data)
  end
end
