class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :name, presence: true
  validates_length_of :name, maximum: 100
  validates :cost, presence: true
  validates_length_of :cost, maximum: 100
  validates :country_of_origin, presence: true
  validates_length_of :country_of_origin, maximum: 100

  before_save(:titleize_product)

  private
  def titleize_product
    self.name = self.name.titleize
  end

end