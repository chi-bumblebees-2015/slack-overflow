class User < ActiveRecord::Base
  has_many :questions, foreign_key: :author_id
  has_many :comments, foreign_key: :commenter_id
  has_many :answers, foreign_key: :answerer_id

  validates :user_name, :length => { :minimum => 3, :message => "must be at least 3 characters, fool!" }
  validates :password, :length => { :minimum => 6 }
  validates :email, :uniqueness => true, :format => /.+@.+\..+/ # imperfect, but okay

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(pass)
    @entered_password = pass
    @password = Password.create(pass)
    self.password_hash = @password
  end

  def self.authenticate(email, password)
    user = User.find_by_email(email)
    return user if user && (user.password == password)
    nil # either invalid email or wrong password
  end
end
