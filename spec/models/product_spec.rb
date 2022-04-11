require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    
    it 'validates that the product has a :name' do
      @category = Category.create(:name => 'test')
      @product = Product.create(:category_id => @category.id, :name => 'test_product')
      expect(@product.name).to be_present
    end

    it 'validates that the product has a :price' do
      @category = Category.create(:name => 'test')
      @product = Product.create(:category_id => @category.id)

    end

    it 'validates that the product has a :quantity' do
    
    end

    it 'validates that the product has a :category' do
    
    end

  end
end
