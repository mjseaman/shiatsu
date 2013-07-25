class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :post_votes
  validates :title, :url, presence: true
end
