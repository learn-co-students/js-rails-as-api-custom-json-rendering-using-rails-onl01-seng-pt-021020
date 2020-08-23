class BirdsController < ApplicationController
  def index
    birds = Bird.all
    render json: birds, only: [:id, :name, :species]
    # only and except are parameters of to_json method and when written out in full look like the following:
    # render json: birds.to_json(only: [:id, :name, :species])
  end

  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: bird, only: [:id, :name, :species]
      # render json: bird.to_json(only: [:id, :name, :species])
    else
      render json: { message: 'Bird not found' }
    end
    
  end
end