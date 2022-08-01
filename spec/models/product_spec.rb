require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should not let a product be created without a name' do
      @category = Category.new
      @product = Product.new(name: nil, price: 28888, quantity: 15, category: @category)
    end
    it 'should not let a product be created without a price' do
      @category = Category.new
      @product = Product.new(name: "Fancy Tree", price: nil, quantity: 15, category: @category)
    end
    it 'should not let a product be created without a quantity' do
      @category = Category.new
      @product = Product.new(name: "Fancy Tree", price: 28888, quantity: nil, category: @category)
    end
    it 'should not let a product be created without a category' do
      @category = Category.new
      @product = Product.new(name: "Fancy Tree", price: 28888, quantity: 15, category: nil)
    end
  end
end
