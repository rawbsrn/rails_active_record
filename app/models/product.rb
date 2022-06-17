class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :name,:cost,:country_of_origin, presence: true
  validates_length_of :name, :country_of_origin, maximum: 100
  

  before_save(:titleize_product)

  scope :recent_products, -> {(all.where.not(updated_at: nil)
  .order("updated_at DESC").last(3)
  )}

  scope :united_states, -> {(where(country_of_origin: "United States of America")
  )}

  scope :review_ratings, -> {(
  select("products.id, products.name, reviews.product_id, count(reviews.id) as ratings_count")
  .joins(:reviews)
  .group("products.id, reviews.product_id")
  .order("ratings_count DESC")
  .limit(1)
  )}

  private
  def titleize_product
    self.name = self.name.titleize
  end

end