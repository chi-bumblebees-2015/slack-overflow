class Question < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :author, class_name: "User"
  has_many :comments
end
