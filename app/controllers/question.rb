### Render new question form ###
get '/questions/new' do
  if current_user
    @question = Question.new
    erb :'questions/new'
  else
    redirect '/sessions/new'
  end
end

### Create new question ###
post '/questions' do
  if current_user
    @question = Question.new(params[:question])
    current_user.questions << @question
    if @question.save
      redirect "/questions/#{@question.id}"
    else
      @errors = @question.errors.full_messages
      erb :'questions/new'
    end
  else
    redirect "/sessions/new"
  end
end


### Render edit question form ###
get '/questions/:id/edit' do
  @question = Question.find(params[:id])
    erb :'questions/edit'
end


### Edit question ###
put '/questions/:id' do
  @question = Question.find(params[:id])
  @question.update(params[:question])
  redirect "/questions/#{@question.id}"
end


### Delete question ###
delete '/questions/:id' do
  @question = Question.find(params[:id])
  @question.destroy
  redirect "/questions/index"
end

### Render all questions ###
get '/questions/index' do
  @questions = Question.all
  erb :'questions/all'
end

### Render one question ####
get '/questions/:id' do
  @question = Question.find(params[:id])
  erb :'questions/show'
end

### Render all questions in a certain tag ###
get '/tags/:id' do
  @tag = Tag.find(params[:id])
  @questions = Question.all.select{ |question| question.tags.include?(@tag)}

  erb :'tags/show'
end


