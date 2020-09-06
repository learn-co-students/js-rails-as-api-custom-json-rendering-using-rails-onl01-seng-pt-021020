class BirdsController < ApplicationController
  def index
    birds = Bird.all
    render json: birds, only: [:id, :name, :species] #'only:' is used instead of slice b/c slice can't be used on an array of hashes!
    # render json: birds.to_json(except: [:created_at, :updated_at]) <-- whats happening in the above line

  end

  def show
    bird = Bird.find_by(id: params[:id])
    # render json: {id: bird.id, name: bird.name, species: bird.species } 
    # render json: bird.slice(:id, :name, :species)
    if bird
      render json: { id: bird.id, name: bird.name, species: bird.species }
    else
      render json: { message: 'Bird not found' }
    end
  end
end