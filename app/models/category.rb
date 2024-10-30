class Category < ApplicationRecord
  has_many :breeds

  validates :name, presence: true
end
