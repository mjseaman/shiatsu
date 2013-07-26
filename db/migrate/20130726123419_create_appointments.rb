class CreateAppointments < ActiveRecord::Migration
  def change
  	create_table :appointments do |t|
  		t.datetime appt_at




  		t.belongs_to :patient
  		t.belongs_to :therapist
  	}
  	end
  end
end
