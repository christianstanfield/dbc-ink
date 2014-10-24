get '/' do
  @photos = Photo.all
  erb :index
end

post '/sessions' do
  @user = User.find_by(params[:user])

  if @user
    session[:user] = @user
    redirect "/user/#{@user.id}"
  else
    @message = "LOL you can't get in"
    @photos = Photo.all
    erb :index
  end
end

get '/logout' do
  session.clear
  redirect '/'
end