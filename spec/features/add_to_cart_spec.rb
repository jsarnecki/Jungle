require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    1.times do |n|
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

  visit root_path

  expect(page).to have_content('My Cart (0)')

  first('footer.actions').click_on('Add')

  expect(page).to have_content('My Cart (1)')
 
  # save_screenshot

end

end