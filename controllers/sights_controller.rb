get '/sights' do
  @continents = Continent.list_all()
  @countries = Country.list_all()
  @locations = Location.list_all()
  @sights = Sight.list_all()
  erb(:"sights/index")
end

get '/sights/new' do
  @sight = Sight.all()
  erb(:"sights/new")
end

post '/sights' do
  @sight = Sight.new(params)
  @sight.save()
  erb(:"sights/created")
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
  erb(:"sights/edit")
end

post '/sights/:id' do
  @sight = Sight.new(params)
  @sight.update()
  erb(:"sights/updated")
end
