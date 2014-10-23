
get '/' do
  @albums = Album.all
  @photos = Photo.all
  erb :index
end

post '/login' do
  @user = User.find_by(params[:user])

  if @user
    session[:user] = @user
    redirect "/user/#{@user.id}"
  else
    @message = "LOL you can't get in"
    @albums = Album.all
    @photos = Photo.all
    erb :index
  end
end

get '/logout' do
  session.clear
  redirect '/'
end

post '/register' do
  @user = User.new(params[:user])
  if @user.valid?
    @user.save
    redirect '/'
  else
    @message = "Get that shit outta here"
    @albums = Album.all
    @photos = Photo.all
    erb :index
  end
end

get '/user/:user_id' do
  if session[:user]
    @albums = session[:user].albums
    @photos = session[:user].photos
    erb :user
  else
    @message = "Get that shit outta here"
    @albums = Album.all
    @photos = Photo.all
    erb :index
  end
end

post '/upload' do
  @user = session[:user]
  album = @user.albums.find_or_create_by(name: params[:album])
  album.photos.create!(photo_url: params[:photo_url])
  # @current_photo = Photo.new(params[:user])
  # @current_photo.photo_url = params[:user][:photo_url]
  redirect "/user/#{@user.id}"
end

get '/album/:album_id' do
  @album = Album.find(params[:album_id])
  @photos = @album.photos

  erb :album

end

