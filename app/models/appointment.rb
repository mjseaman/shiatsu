class Appointment < ActiveRecord::Base
  belongs_to :patient
  belongs_to :therapist
  has_many :ratings

  validates_presence_of :therapist
  validates_uniqueness_of :start_at

  before_validation :set_date

  def set_date
    self.start_date = start_at.to_date
  end

end
