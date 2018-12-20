class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  get '/' do 
    erb :welcome
  end 
  
  get '/recipes' do 
    @recipes = Recipe.all
    erb :index
  end 
  
  get '/recipes/new' do 
    erb :new 
  end 
  
  post '/recipes' do 
    recipe = Recipe.new(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time] )
    recipe.save
    redirect '/recipes'
  end 
  
  get '/recipes/:id' do 
    @recipe = Recipe.find(params[:id])
    erb :show 
  end 
  

end
