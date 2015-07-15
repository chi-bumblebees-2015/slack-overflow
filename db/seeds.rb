require 'faker'

User.destroy_all
Question.destroy_all
Comment.destroy_all


name = Faker::Name
internet = Faker::Internet
company = Faker::Company
lorem = Faker::Lorem
3.times do
  User.create(user_name: name.name, email: internet.email, password_hash: 'password')
end

users = User.all

users.each do |user|
  2.times do
    Question.create(title: company.bs, body: lorem.paragraph, author: user)
  end
end

questions = Question.all
questions.each do |question|
  2.times do
    Comment.create(question: question, commenter: users.sample, body: company.bs)
  end
end
