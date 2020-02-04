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
  if (params[:name] == '')
    @error_message = "Please give it a name!"
    @countries = Country.list_all()
    erb(:"locations/new")
  elsif ( Location.find_by_name(params[:name]) != nil )
    @error_message = "Location already exists!"
    @countries = Country.list_all()
    erb(:"locations/new")
  else
    @location = Location.new(params)
    @location.save()
    erb(:"locations/created")
  end
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
  if (params[:name] == '')
    @error_message = "Please give it a name!"
    location_id = params[:id]
    @location = Location.find_by_id(location_id)
    @countries = Country.list_all()
    erb(:"locations/edit")
  elsif ( Location.find_by_name(params[:name]) != nil )
    @error_message = "Location already exists!"
    location_id = params[:id]
    @location = Location.find_by_id(location_id)
    @countries = Country.list_all()
    erb(:"locations/edit")
  else
    @location = Location.new(params)
    @location.update()
    erb(:"locations/updated")
  end
end
