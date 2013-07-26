class CreateAppointments < ActiveRecord::Migration
  def change
  	create_table :appointments do |t|
  		t.datetime :appt_at
  		t.references :patient
  		t.references :therapist
  		t.timestamps
  	end
  end
end
