### Render all tags ###
get '/tags/index' do
  @tags = Tag.all.sort_by{|tag| tag.questions.length}.reverse

  erb :'tags/all'
end

### Render all questions in a certain tag ###
get '/tags/:id' do
  @tag = Tag.find(params[:id])
  @questions = Question.all.select{ |question| question.tags.include?(@tag)}

  erb :'tags/show'
end

