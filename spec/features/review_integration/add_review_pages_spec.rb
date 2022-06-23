require 'rails_helper'

describe "the add a review process" do
  it "adds a new review" do
    User.destroy_all
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
    click_on 'Add a review'
    fill_in 'Author', :with => 'Test Author'
    fill_in 'Rating', :with => '3'
    fill_in 'Content body', :with => 'This is not the greatest sentence in the world, no, this is just a tribute.'
    click_on 'Create Review'
    expect(page).to have_content 'Review successfully added!'
    expect(page).to have_content 'Test Author'
  end
end