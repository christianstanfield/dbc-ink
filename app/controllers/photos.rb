get "/photos/new" do
  @photo = Photo.new
  erb :"photos/new"
end

post '/photos' do
  @user = User.find(session[:user_id])
  @user.photos.create!(url: params[:url], description: params[:description])

  redirect "/"
end
