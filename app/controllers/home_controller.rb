class HomeController < ApplicationController
  def index
    if params[:query].present?
      # Find the breeds based on the search query
      @breeds = Breed.where("name ILIKE ?", "%#{params[:query]}%") # Use ILIKE for case-insensitive search

      if @breeds.empty?
        flash[:alert] = "Oops, the breed you entered does not exist in our database!"
      end
    else
      # Paginate all breeds if no query is entered
      @breeds = Breed.page(params[:page]).per(9)
    end

    @all_breeds = Breed.all  # Fetch all breeds for the dropdown
  end
end
