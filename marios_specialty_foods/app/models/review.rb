class Review < ApplicationRecord
  belongs_to :product
  validates :author, presence: true
  validates_length_of :author, maximum: 100
  validates :content_body, presence: true
  validates_length_of :content_body, minimum:50, maximum: 250
  validates :rating, presence: true
  validates_length_of :rating, maximum: 100
end