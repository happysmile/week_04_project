get '/sight-types' do
  erb(:"sight_types/index")
end

get '/sight-types/new' do
  erb(:"sight_types/new")
end

post '/sight-types/' do
  @sight_type = SightType.new(params)
  @sight_type.save()
  erb(:"sight_types/index")
end

get '/sight-types/:id/edit' do
  erb(:"sight_types/edit")
end

post '/locations/:id' do
  @sight_type = SightType.new(params)
  @sight_type.update()
  erb(:"sight_types/index")
end

post '/sight-types/:id/delete' do
  sight_type_id = params[:id]
  sight_type = SightType.find_by_id(sight_type_id)
  sight_type.delete()
  redirect '/sight-types'
end
