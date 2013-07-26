class CreateRatings < ActiveRecord::Migration
  def change
  	create_table :ratings do |t|
  		t.integer :rating
  		t.string :comment
  		t.belongs_to :appointment
  	end
  end
end
