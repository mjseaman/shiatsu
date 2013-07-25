class CreateUsersCommentsPosts < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, unique: true
      t.string :password_hash
      t.string :first_name
      t.string :last_name
      t.timestamps
    end

    create_table :posts do |t|
      t.string :title
      t.string :url
      t.string :body
      t.belongs_to :user
      t.timestamps
    end

    create_table :comments do |t|
      t.string :text
      t.belongs_to :user
      t.belongs_to :post
      t.timestamps
    end
  end
end
