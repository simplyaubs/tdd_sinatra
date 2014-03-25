require 'capybara/rspec'
require 'spec_helper'
require_relative '../app'

Capybara.app = App

feature "Menu Site" do
  scenario "User can manage items in a menu" do
    visit '/'
    expect(page).to have_content("Welcome to our Menu")

    click_on "Items"
    expect(page).to_not have_content("Pizza")
    click_on "Add Item"
    fill_in "name", :with => "Pizza"
    click_on "Submit"
    expect(page).to have_content("Pizza")

    click_on "Show Item"
    expect(page).to have_content("Pizza")

    click_on "Edit Item"
    fill_in "name", :with => "Pasta"
    click_on "Submit"
    expect(page).to have_content("Pasta")
    expect(page).to_not have_content("Pizza")

    click_on "Delete Item"
    expect(page).to_not have_content("Pasta")
  end
end