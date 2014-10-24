get "/photos/new" do
  @photo = Photo.new
  erb :"photos/new"
end

post '/photos' do
  @user = session[:user]
  @user.photos.create!(url: params[:url], description: params[:description])
  
  redirect "/user/#{@user.id}"
end