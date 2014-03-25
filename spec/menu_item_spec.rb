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
    click_on "Add Item"
    fill_in "name", :with => "Pizza"
    choose "Add Item"
    click_on "Submit"
    expect(page).to have_content("Pizza")

    click_on "Show Item"
    expect(page).to have_content("Pizza")

    click_on "Edit Item"
    fill_in "name", :with => "Pasta"
    choose "Rename Item"
    click_on "Submit"
    expect(page).to have_content("Pasta")
    #renames item
    #deletes item


  end
end