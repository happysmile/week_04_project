get '/sights' do
  @continents = Continent.list_all()
  @countries = Country.list_all()
  @locations = Location.list_all()
  @sights = Sight.list_all()
  erb(:"sights/index")
end

get '/search' do
  @locations = Location.list_all()
  @sight_types = SightType.list_all()
  @countries = Country.list_all()
  erb(:"sights/search" )
end

post '/search-results' do
  # if (params[:visited] == 'visited')
  #   params[:visited] = true
  # else
  #   params[:visited] = false
  # end
  @sights = Sight.search(params)
  erb(:"sights/index")
end

post '/search-by-country' do
  country = Country.find_by_id(params[:country_id].to_i)
  @sights = country.sights()
  erb(:"sights/index")
end

get '/sights/new' do
  @types = SightType.list_all()
  @locations = Location.list_all()
  erb(:"sights/new")
end

post '/sights' do
  if ( (params[:name] == '') || (params[:location_id] == '') || (params[:type_id] == '') )
    @types = SightType.list_all()
    @locations = Location.list_all()
    @error_message = "Name, location and type are required"
    erb(:"sights/new")
  else
    if (params[:visited] == 'visited')
      params[:visited] = true
    else
      params[:visited] = false
    end
    @sight = Sight.new(params)
    @sight.save()
    erb(:"sights/created")
  end
end

get '/sights/:id' do
  sight_id = params[:id]
  @sight = Sight.find_by_id(sight_id)
  erb(:"sights/sight")
end

post '/sights/:id/delete' do
  sight_id = params[:id]
  sight = Sight.find_by_id(sight_id)
  sight.delete()
  redirect '/sights'
end

get '/sights/:id/edit' do
  sight_id = params[:id]
  @sight = Sight.find_by_id(sight_id)
  @types = SightType.list_all()
  @locations = Location.list_all()
  erb(:"sights/edit")
end

post '/sights/:id' do
  if ( (params[:name] == '') || (params[:location_id] == '') || (params[:type_id] == '') )
    @types = SightType.list_all()
    @locations = Location.list_all()
    @error_message = "Name, location and type are required"
    erb(:"sights/edit")
  else
    if (params[:visited] == 'visited')
      params[:visited] = true
    else
      params[:visited] = false
    end
    @sight = Sight.new(params)
    @sight.update()
    erb(:"sights/updated")
  end
end
