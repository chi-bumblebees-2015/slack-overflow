class Question < ActiveRecord::Base
  validates_presence_of :title, :body, :author

  belongs_to :author, class_name: "User"
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :taggings
  has_many :tags, through: :taggings
  has_many :votes, as: :votable

  def tag_list=(tag_list)
    self.tags = tag_list.split(",").map { |tag| Tag.find_or_initialize_by(name: tag.strip.capitalize)}
  end

  def tag_list
    self.tags.map { |tag| tag.name }.join(", ")
  end

end
