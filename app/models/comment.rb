class Comment < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :commenter, class_name: "User"
  belongs_to :question

end
