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

  scenario "When they click on Add, the cart count goes up by 1" do
    # ACT
    visit root_path

    # click on add to cart
    find('article.product footer.actions button', match: :first).click

    # DEBUG / VERIFY
    save_screenshot

    expect(find('#navbar ul > li.cart-link > a')).to have_content 'My Cart (1)'
  end
end
