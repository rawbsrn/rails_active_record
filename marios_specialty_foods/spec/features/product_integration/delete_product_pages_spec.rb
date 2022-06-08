require 'rails_helper'

describe "the delete a product process", js: true do
  it "deletes a new product" do
    visit products_path
    click_link 'Create new product'
    fill_in 'Name', :with => 'Good Test'
    fill_in 'Cost', :with => '3.50'
    fill_in 'Country of origin', :with => 'United States of America'
    click_on 'Create Product'
    click_link('Good Test', match: :first)
    accept_confirm do
      click_link('Delete product')
    end
    expect(page).to have_content 'Product successfully DESTROYED!!'
  end

  it "gives an error when no name is entered" do
    visit new_product_path
    click_on 'Create Product'
    expect(page).to have_content "Name can't be blank"
  end
end