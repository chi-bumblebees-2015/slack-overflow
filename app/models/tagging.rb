class Tagging < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :tag
  belongs_to :question

end
