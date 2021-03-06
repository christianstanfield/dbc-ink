get '/' do
  @photos = Photo.all
  erb :index
end

post '/sessions' do
  @user = User.find(params[:user_id])

  if @user
    session[:user] = @user
    redirect "/user/#{@user.id}"
  else
    @photos = Photo.all
    erb :index
  end
end

get '/logout' do
  session.clear
  redirect '/'
end
