class BreedsController < ApplicationController
  def index
    @breeds = Breed.all.page(params[:page]).per(9)  # Fetch all breeds for pagination

    if params[:query].present?
      # Perform the search with case-insensitive matching
      @breeds = Breed.where("LOWER(name) LIKE ?", "%#{params[:query].downcase}%").page(params[:page]).per(9)

      # Check if the search returned any results
      if @breeds.empty?
        @message = "Oops, the breed you entered does not exist in our database!"
      end
    end
  end
end
