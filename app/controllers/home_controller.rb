class HomeController < ApplicationController
  def index
    if params[:query].present?
      # Search for breeds based on user input
      @breeds = Breed.where("name ILIKE ?", "%#{params[:query]}%")

      # Check if the breed exists
      if @breeds.empty?
        flash.now[:alert] = "Oops, the breed you entered does not exist in our database!"
      end
    else
      # Paginate all breeds if no breed is selected
      @breeds = Breed.page(params[:page]).per(9)
    end

    @all_breeds = Breed.all  # Fetch all breeds for the dropdown
  end
end
