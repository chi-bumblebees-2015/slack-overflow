class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :questions, foreign_key: :author_id
  has_many :comments, foreign_key: :commenter_id
  has_many :answers, foreign_key: :answerer_id
end
