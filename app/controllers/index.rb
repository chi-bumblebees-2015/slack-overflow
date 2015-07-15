get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/sessions/new' do
  # Look in app/views/index.erb
  erb :login
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end

post '/sessions' do
  # sign-in
  @email = params[:email]
  user = User.authenticate(@email, params[:password])
  if user
    # successfully authenticated; set up session and redirect
    session[:user_id] = user.id
    redirect '/'
  else
    # an error occurred, re-render the sign-in form, displaying an error
    erb :login
  end
end

