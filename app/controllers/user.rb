get '/register' do
  @display = "_register"
  erb :index
end

get '/sign_out' do
  session.clear
  redirect ('/')
end

post '/sign_in' do
  @user = User.authenticate(params[:email], params[:password])
  session[:user_id] = @user.id
  redirect("/profile/#{@user.id}")
end

post '/register' do
  @user = User.new(params[:user])
  @user.save!
  redirect('/')
end
