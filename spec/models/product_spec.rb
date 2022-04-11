require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it 'validates that when all four fields are set, it saves successfully' do
      @category = Category.create(:name => 'test')
      @product = Product.create(:category_id => @category.id, :name => 'test_product', :price => 100, :quantity => 5)
      expect(@product.category_id).to be_present
      expect(@product.price).to be_present
      expect(@product.name).to be_present
      expect(@product.quantity).to be_present
    end
    
    it 'validates that the product must contain :name' do
      @category = Category.create(:name => 'test')
      @product = Product.create(:category_id => @category.id, :quantity => 10, :price => 5000, :name => nil)
      expect(@product.errors.full_messages).to include "Name can't be blank"
    end

    it 'validates that the product must contain :price' do
      @category = Category.create(:name => 'test')
      @product = Product.create(:category_id => @category.id, :quantity => 10, :name => 'test_product', :price => nil)
      expect(@product.errors.full_messages).to include "Price can't be blank"
    end

    it 'validates that the product must contain :quantity' do
      @category = Category.create(:name => 'test')
      @product = Product.create(:category_id => @category.id, :quantity => nil, :price => 5000, :name => 'text_product')
      expect(@product.errors.full_messages).to include "Quantity can't be blank"
    end

    it 'validates that the product must contain :category' do
      @category = Category.create(:name => 'test')
      @product = Product.create(:category_id => nil, :quantity => 10, :price => 5000, :name => 'text_product')
      expect(@product.errors.full_messages).to include "Category can't be blank"
    end

  end
end
