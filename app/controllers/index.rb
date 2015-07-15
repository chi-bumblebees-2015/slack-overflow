get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/sessions/new' do
  # Look in app/views/index.erb
  erb :'/users/login'
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
    @error = "Invalid Email or Password."
    erb :'/users/login'
  end
end

get '/users/new' do
  @user = User.new
  erb :'users/sign_up'
end

post '/users' do
  # sign-up
  @user = User.new params[:user]
  if @user.save
    # successfully created new account; set up the session and redirect
    session[:user_id] = @user.id
    redirect '/'
  else
    # an error occurred, re-render the sign-up form, displaying errors
    @error = "Invalid credentials."
    erb :'users/sign_up'
  end
end
