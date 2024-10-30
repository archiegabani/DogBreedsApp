class BreedsController < ApplicationController
  def index
    @breeds = Breed.all.page(params[:page]).per(9)  # Pagination for all breeds

    if params[:query].present?
      @breeds = Breed.where("LOWER(name) LIKE ?", "%#{params[:query].downcase}%").page(params[:page]).per(9)

      # Check if any breeds were found
      if @breeds.empty?
        @message = "Oops, the breed you entered does not exist in our database!"
      end
    end
  end
end
