class BirdsController < ApplicationController
  def index
    birds = Bird.all
    render json: birds, only: [:id, :name, :species]
    
    # OR: render json: birds, except: [:created_at, :updated_at]
    
    #While slice works fine for a single hash, as with bird, it won't work for an array of hashes like the one we have in our index action.
    #In this case, we can add in the only: option directly after listing an object we want to render to JSON:
  end
 
  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: { id: bird.id, name: bird.name, species: bird.species }
    else
      render json: { message: 'Bird not found' }
    #OR: render json: bird.slice(:id, :name, :species)
    #Rather than having to spell out each key, the Hash slice method returns a new hash with only the keys that are passed into slice
    #While slice works fine for a single hash, as with bird, it won't work for an array of hashes like the one we have in our index action:
    end
  end 
end
