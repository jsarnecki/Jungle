require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

scenario "They can click 'Add to Cart' for a product on the home page and have their cart increase by 1" do
  # ACT
  visit root_path

  #find add to cart button, click

  #checkout the nav cart icon to see if it has 1 item
  
  # save_screenshot

end

end