class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, unique: true
      t.string :password_hash
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.boolean :is_active, default: true
      t.string :type
      t.integer :appt_count, default: 0
      t.integer :appt_count_max, default: 4
      t.string :pressure_preference
      t.timestamps
    end
  end
end
