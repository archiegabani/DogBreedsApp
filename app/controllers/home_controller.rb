class HomeController < ApplicationController
  def index
    if params[:breed_id].present?
      # Find the selected breed
      @breeds = Breed.where(id: params[:breed_id])  # This will return the breed that matches the selected ID
    else
      # Paginate all breeds if no breed is selected
      @breeds = Breed.page(params[:page]).per(9)
    end

    @all_breeds = Breed.all  # Fetch all breeds for the dropdown
  end
end
