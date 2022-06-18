require 'rails_helper'

describe "the add a product process" do
  it "adds a new product" do
    user = User.create!(:email => 'admin@testaccount.com',:username => 'testadmin', :password => 'correcthorsebatterystaple', :admin => true)
    login_as(user, :scope => :admin, :run_callbacks => false)
    visit root_path
    find_button('Create new product')
    fill_in 'Name', :with => 'Test Product'
    fill_in 'Cost', :with => '3.50'
    fill_in 'Country of origin', :with => 'United States of America'
    click_button 'Create Product'
    expect(page).to have_content 'Product successfully added!'
    expect(page).to have_content 'Test Product'
  end

  it "gives an error when no name is entered" do
    visit new_product_path
    click_on 'Create Product'
    expect(page).to have_content "Name can't be blank"
  end
end