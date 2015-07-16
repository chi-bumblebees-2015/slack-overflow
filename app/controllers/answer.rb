### Create new answer ###

get '/questions/:id/answers/new' do
  @question = Question.find(params[:id])

  erb :'answers/new'
end

post '/questions/:id/answers' do
  question_id = params[:id]
  body = params[:body]
  answerer_id = session[:user_id]
 answer = Answer.new(body: body, question_id: question_id, answerer_id: answerer_id)
 if answer.save
    redirect "/questions/#{question_id}"
  else
    erb :'answers/new'
  end
end

get '/questions/:question_id/answers/:answer_id/edit' do
  @question = Question.find(params[:question_id])
  @answer = Answer.find(params[:answer_id])
  erb :'answers/edit'
end

put '/questions/:question_id/answers/:answer_id' do
  question_id = params[:question_id]
  new_body = params[:body]
  @answer = Answer.find(params[:answer_id])


  @answer.update(body: new_body)

    redirect "/questions/#{question_id}"
end

delete '/questions/:question_id/answers/:answer_id' do
  question_id = params[:question_id]
  @answer = Answer.find(params[:answer_id])
   @answer.destroy
   redirect "/questions/#{question_id}"
end
















