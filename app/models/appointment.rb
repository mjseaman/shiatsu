class Appointment < ActiveRecord::Base
  belongs_to :patient
  belongs_to :therapist
  has_many :ratings

  validates_presence_of :therapist
  validates_uniqueness_of :start_at

end
