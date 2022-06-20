require 'rails_helper'

describe "the edit a product process" do
  it "adds a new product" do
    user = User.create!(:email => 'admin@testaccount.com',:username => 'testadmin', :password => 'correcthorsebatterystaple', :admin => true)
    visit root_path
    click_link('Log in')
    fill_in "Login", :with => "admin@testaccount.com"
    fill_in "Password", :with => "correcthorsebatterystaple"
    click_button('Log in')
    visit products_path
    click_link 'Create new product'
    fill_in 'Name', :with => 'Test Product'
    fill_in 'Cost', :with => '3.50'
    fill_in 'Country of origin', :with => 'United States of America'
    click_on 'Create Product'
    click_link('Test Product', match: :first)
    click_link('Edit', match: :first)
    fill_in 'Name', :with => 'Edited Product'
    click_on 'Update Product'
    expect(page).to have_content 'Product successfully updated!'
    expect(page).to have_content 'Edited Product'
    user.destroy
  end

  it "gives an error when no name is entered" do
    user = User.create!(:email => 'admin@testaccount.com',:username => 'testadmin', :password => 'correcthorsebatterystaple', :admin => true)
    visit root_path
    click_link('Log in')
    fill_in "Login", :with => "admin@testaccount.com"
    fill_in "Password", :with => "correcthorsebatterystaple"
    click_button('Log in')
    visit products_path
    visit new_product_path
    click_on 'Create Product'
    expect(page).to have_content "Name can't be blank"
    user.destroy
  end
end