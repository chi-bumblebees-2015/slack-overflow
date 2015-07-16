post '/vote' do
  if current_user
    if params[:type] == 'Question'
      Vote.find_or_create_by(voter: current_user, votable: Question.find(params[:id]))
      redirect "/questions/#{params[:id]}"
    elsif params[:type] == 'Answer'
       Vote.find_or_create_by(voter: current_user, votable: Answer.find(params[:id]))
       question = Answer.find(params[:id]).question
       redirect "/questions/#{question.id}"
    end
  end
end

