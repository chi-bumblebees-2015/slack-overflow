get '/questions/:question_id/answers/:answer_id/comments/new' do
  @question = Question.find(params[:question_id])
  @answer = Answer.find(params[:answer_id])

  erb :'comments/new'
end

post "/questions/:question_id/answers/:answer_id/comments" do
  question_id = params[:question_id]
  # answer_id = params[:answer_id]
  answer = Answer.find(params[:answer_id])
  body = params[:body]
  commenter_id = session[:user_id]
  # comment = Comment.new(body: body, commentable_id: answer_id, commenter_id: commenter_id)
  comment = Comment.new(body: body, commentable: answer, commenter_id: commenter_id)

   if comment.save
    redirect "/questions/#{question_id}"
  else
    erb :'comments/new'
  end
end

delete '/questions/:question_id/answers/:answer_id/comments/:comment_id' do
  question_id = params[:question_id]
  # @answer = Answer.find(params[:answer_id])
  @comment = Comment.find(params[:comment_id])

   @comment.destroy
   redirect "/questions/#{question_id}"
end
