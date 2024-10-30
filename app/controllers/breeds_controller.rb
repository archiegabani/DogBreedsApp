class BreedsController < ApplicationController
  def index
    if params[:query].present?
      # Use LOWER() to convert both the breed name and query to lowercase for case-insensitive comparison
      @breeds = Breed.where(id: params[:query]).page(params[:page]).per(9)
    else
      @breeds = Breed.page(params[:page]).per(9)
    end
  end

  def show
    @breed = Breed.find(params[:id])
  end
end
