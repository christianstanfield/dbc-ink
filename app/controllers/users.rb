get '/users/new' do
  @user = User.new
  erb :"users/new"
end

post '/users' do
  @user = User.new(params[:user])
  if @user.valid?
    @user.save
    redirect '/'
  else
    @photos = Photo.all
    erb :index
  end
end

get '/user/:user_id' do
  if session[:user]
    # @albums = session[:user].albums
    @user = session[:user]
    @photos = session[:user].photos
    erb :"users/show"
  else
    @photos = Photo.all
    erb :index
  end
end
