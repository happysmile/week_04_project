get '/countries' do
  @countries = Country.list_listed()
  erb(:"countries/index")
end

get '/countries/:id' do
  @country = Country.find_by_id(params[:id])
  erb(:"countries/country")
end
