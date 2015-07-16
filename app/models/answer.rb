class Answer < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :question
  belongs_to :answerer, class_name: "User"
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :votes, as: :votable
end
