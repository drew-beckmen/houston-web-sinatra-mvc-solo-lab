class PuppiesController < ApplicationController
    get '/puppies' do 
        @puppies = Puppy.all 
        erb :index 
    end 
    
    get '/puppies/new' do 
        erb :new
    end 

    post '/puppies/new' do 
        redirect '/puppies/new'
    end 

    get '/puppies/:id' do 
        @puppy = Puppy.find(params[:id])
        erb :show 
    end 

    post '/puppies' do 
        new_puppy = Puppy.create(params)
        redirect '/puppies'
    end 

    get '/puppies/:id/edit' do 
        @puppy = Puppy.find(params[:id])
        erb :edit
    end 

    patch '/puppies/:id' do 
        puppy = Puppy.find(params[:id])
        puppy.update(name: params[:name], breed: params[:breed])
        redirect "/puppies/#{puppy.id}"
    end

    delete '/puppies/:id' do 
        Puppy.delete(params[:id])
        redirect '/puppies'
    end
end