require 'faker'

User.destroy_all
Question.destroy_all
Answer.destroy_all


name = Faker::Name
internet = Faker::Internet
company = Faker::Company
lorem = Faker::Lorem
3.times do
  User.create(user_name: name.name, email: internet.email, password: 'password')
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
    Answer.create(question: question, answerer: users.sample, body: company.bs)
  end
end
