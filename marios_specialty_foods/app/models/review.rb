class Review < ApplicationRecord
  belongs_to :product
  validates :author,:content_body,:rating, presence: true
  validates_length_of :author, maximum: 100
  validates_length_of :content_body, minimum:50, maximum: 250
end