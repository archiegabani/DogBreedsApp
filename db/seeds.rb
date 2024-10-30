# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'httparty'
# db/seeds.rb

# Clear existing records to avoid duplicates
Breed.destroy_all
Category.destroy_all

# Helper function to fetch data from Dog API
def fetch_dog_api(endpoint)
  HTTParty.get("https://dog.ceo/api/#{endpoint}")
end

# Fetch and create Categories
categories = [ "Small", "Medium", "Large" ]  # Example categories by breed size
categories.each do |category|
  Category.create!(name: category)
end

# Fetch Breeds
breed_list = fetch_dog_api("breeds/list/all")["message"]
breed_list.each do |breed, _|
  # Assign a random category
  category = Category.order("RANDOM()").first
  new_breed = Breed.create!(name: breed.capitalize, category: category)

  # Fetch random images for the breed
  3.times do  # limiting to 3 images per breed
    image_url = fetch_dog_api("breed/#{breed}/images/random")["message"]
    Image.create!(url: image_url, breed: new_breed)
  end
end
