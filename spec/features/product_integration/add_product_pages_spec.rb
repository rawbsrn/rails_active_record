require 'rails_helper'

describe "the add a product process" do
  it "adds a new product" do
    user = User.create!(:email => 'admin@testaccount.com',:username => 'testadmin', :password => 'correcthorsebatterystaple', :admin => true)
    visit root_path
    click_link('Log in')
    fill_in "Login", :with => "admin@testaccount.com"
    fill_in "Password", :with => "correcthorsebatterystaple"
    click_button('Log in')
    visit products_path
    click_link('Create new product')
    fill_in 'Name', :with => 'Test Product'
    fill_in 'Cost', :with => '3.50'
    fill_in 'Country of origin', :with => 'United States of America'
    click_button('Create Product')
    expect(page).to have_content 'Product successfully added!'
    expect(page).to have_content 'Test Product'
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
    click_button('Create Product')
    expect(page).to have_content "Name can't be blank"
    user.destroy
  end

end