class Product < ApplicationRecord
	has_one :basket, dependent: :destroy
	validates :code, :name, :price, presence: true
	validates :name, uniqueness: true
  after_create :create_basket
  private

	def create_basket
    Basket.create(product_id: self.id, quantity: 0)
  end

end
