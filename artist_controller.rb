require( 'sinatra' )
require( 'sinatra/contrib/all' ) if development?
require( 'pry-byebug' )
require_relative( './models/artist.rb' )

get '/artists' do
  #index
  @artists = Artist.all()
  erb( :artists )
end

get '/artists/new' do
  #new
  erb( :new )
end

post '/artists' do
  #create
  @artist = Artist.new( params )
  @artist.save()
  erb( :create )
end

get '/artists/:id' do
  #show
  @artist = Artist.find( params[:id] )
  erb( :show )
end

get '/artists/:id/edit' do
  #edit
  @artist = Artist.find( params[ :id ])
  erb( :edit )

end

put '/artists/:id' do
  #update
  @artist = Artist.update( params )
  redirect to("/artists/#{params[:id]}")
end

delete '/artists/:id' do
  #delete
  Artist.delete( params[:id] )
  redirect to("/artists")
end
















