require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should not let a product be created without a name' do
      @category = Category.new
      @product = Product.new(name: nil, price_cents: 28888, quantity: 15, category: @category)
      expect(@product).to be_invalid
    end
    it 'should not let a product be created without a price' do
      @category = Category.new
      @product = Product.new(name: "Fancy Tree", price_cents: nil, quantity: 15, category: @category)
      expect(@product).to be_invalid
    end
    it 'should not let a product be created without a quantity' do
      @category = Category.new
      @product = Product.new(name: "Fancy Tree", price_cents: 28888, quantity: nil, category: @category)
      expect(@product).to be_invalid
    end
    it 'should not let a product be created without a category' do
      @category = Category.new
      @product = Product.new(name: "Fancy Tree", price_cents: 28888, quantity: 15, category: nil)
      expect(@product).to be_invalid
    end
    it 'should create a new product when all required fields are valid' do
      @category = Category.new
      @product = Product.new(name: "Fancy Tree", price_cents: 28888, quantity: 15, category: @category)
      expect(@product).to be_valid
    end
  end
end
