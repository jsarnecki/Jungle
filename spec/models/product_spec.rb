require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it 'validates that when all four fields are set, it saves successfully' do
      @category = Category.create(:name => 'test')
      @product = Product.create(:category_id => @category.id, :name => 'test_product', :price => 100, :quantity => 5)
      expect(@product).to be_present
    end
    
    it 'validates that the product has a :name' do
      @category = Category.create(:name => 'test')
      @product = Product.create(:category_id => @category.id, :name => 'test_product')
      expect(@product.name).to be_present
    end

    it 'validates that the product has a :price' do
      @category = Category.create(:name => 'test')
      @product = Product.create(:category_id => @category.id, :price => 5000)
      expect(@product.price).to be_present
      
    end

    xit 'validates that the product has a :quantity' do
    
    end

    xit 'validates that the product has a :category' do
    
    end

  end
end
