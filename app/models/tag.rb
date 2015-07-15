class Tag < ActiveRecord::Base
  # Remember to create a migration!
  has_many :taggings
  has_many :questions, through: :taggings

end
