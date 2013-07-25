class CreateCommentVotesPostVotes < ActiveRecord::Migration
  def change
  	create_table :comment_votes do |t|
  		t.belongs_to :comment
  		t.belongs_to :user
  		t.timestamps
  	end

  	create_table :post_votes do |t|
  		t.belongs_to :post
  		t.belongs_to :user
  		t.timestamps
  	end
  end
end
