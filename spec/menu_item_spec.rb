require 'capybara/rspec'
require 'spec_helper'
require_relative '../app'

Capybara.app = App

feature "Menu Site" do
  scenario "User can add items" do
    visit '/'
    expect(page).to have_content("Welcome to our Menu")

    click_on "Items"
    expect(page).to_not have_content("Pizza")
    click_on "Edit Items"
    fill_in "name", :with => "Pizza"
    choose "Add Item"
    click_on "Submit"
    expect(page).to have_content("Pizza")

    click_on "Show Item"
    expect(page).to have_content("Pizza")
    #shows item contents
    #renames item
    #deletes item


  end
end