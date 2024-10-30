class Breed < ApplicationRecord
  belongs_to :category
  has_many :images, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
