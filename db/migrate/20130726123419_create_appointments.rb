class CreateAppointments < ActiveRecord::Migration
  def change
  	create_table :appointments do |t|
  		t.datetime :start_at
  		t.integer	:duration # minutes
  		t.references :patient
  		t.references :therapist
  		t.timestamps
  	end
  end
end
