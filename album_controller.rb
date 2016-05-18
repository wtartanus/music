require( 'sinatra' )
require( 'sinatra/contrib/all' ) if development?
require( 'pry-byebug' )
require_relative( './artist_controller.rb' )
require_relative( './models/artist.rb' )
require_relative( './models/album.rb' )

get '/albums' do
  #index
  @albums = Album.all()
  erb( :albums )
end

get '/albums/new' do
  #new
  erb( :albums_new )
end

post '/albums' do
  @artist = params["artist_id"]
  params["artist_id"] = Album.find_id( params[:artist_id] )
  @album = Album.new( params ).save()
  erb( :albums_create)
end

get '/albums/:id' do
  #show
  @album = Album.find( params[:id])
  erb( :albums_show )
end

get '/albums/:id/edit' do
  #edit
  @album = Album.find( params[:id ])

  erb( :albums_edit )
end

put '/albums/:id' do
  #update
  Album.update( params )
  redirect to("/albums/#{params[:id]}")
end

delete '/albums/:id' do
  #delete
  Album.delete( params[:id] )
  redirect to("/albums")
end


