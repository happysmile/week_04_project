get '/sight-types' do
  @sight_types = SightType.list_all()
  erb(:"sight_types/index")
end

get '/sight-types/new' do
  erb(:"sight_types/new")
end

post '/sight-types' do
  if (params[:name] == '')
    @error_message = "Please give it a name!"
    erb(:"sight_types/new")
  elsif ( SightType.find_by_name(params[:name]) != nil )
    @error_message = "Sight type already exists!"
    erb(:"sight_types/new")
  else
    @sight_type = SightType.new(params)
    @sight_type.save()
    redirect '/sight-types'
  end
end

get '/sight-types/:id/edit' do
  @sight_type = SightType.find_by_id(params[:id])
  erb(:"sight_types/edit")
end

post '/sight-types/:id' do
  if (params[:name] == '')
    @error_message = "Please give it a name!"
    erb(:"sight_types/edit")
  elsif ( SightType.find_by_name(params[:name]) != nil )
    @error_message = "Sight type already exists!"
    erb(:"sight_types/edit")
  else
    @sight_type = SightType.new(params)
    @sight_type.update()
    @sight_types = SightType.list_all()
    erb(:"sight_types/index")
  end

end

get '/sight-types/:id' do
  @sight_type = SightType.find_by_id(params[:id])
  erb(:"sight_types/sight_type")
end

post '/sight-types/:id/delete' do
  sight_type_id = params[:id]
  sight_type = SightType.find_by_id(sight_type_id)
  sight_type.delete()
  redirect '/sight-types'
end
