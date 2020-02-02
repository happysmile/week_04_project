get '/locations' do
  @continents = Continent.list_all()
  @countries = Country.list_all()
  @locations = Location.list_all()
  erb(:"locations/index")
end

get '/locations/new' do
  @countries = Country.list_all()
  erb(:"locations/new")
end

post '/locations' do
  @location = Location.new(params)
  @location.save()
  erb(:"locations/created")
end

get '/locations/:id' do
  location_id = params[:id]
  @location = Location.find_by_id(location_id)
  erb(:"locations/location")
end

post '/locations/:id/delete' do
  location_id = params[:id]
  location = Location.find_by_id(location_id)
  location.delete()
  redirect '/locations'
end

get '/locations/:id/edit' do
  location_id = params[:id]
  @location = Location.find_by_id(location_id)
  @countries = Country.list_all()
  erb(:"locations/edit")
end

post '/locations/:id' do
  @location = Location.new(params)
  @location.update()
  erb(:"locations/updated")
end
