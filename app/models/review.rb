class Review < ApplicationRecord
  belongs_to :product
  validates :author,:content_body,:rating, presence: true
  validates :rating, numericality: { only_integer: true, greater_than: 0, less_than: 6 }
  validates_length_of :author, maximum: 100
  validates_length_of :content_body, minimum:50, maximum: 250
end