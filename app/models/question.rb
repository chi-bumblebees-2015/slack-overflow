class Question < ActiveRecord::Base
  validates_presence_of :title, :body, :author

  belongs_to :author, class_name: "User"
  has_many :comments, as: :commentable
  has_many :answers
  has_many :taggings
  has_many :tags, through: :taggings
  has_many :votes, as: :votable
end
