require 'capybara/rspec'
require 'spec_helper'
require_relative '../app'

Capybara.app = App

feature "Menu Site" do
  scenario "User can open the homepage" do
    visit '/'

    expect(page).to have_content("Welcome to our Menu")

    click_on "Items"
    expect(page).to_not have_content("Pizza")
  end
end