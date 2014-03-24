require 'capybara/rspec'
require 'spec_helper'
require_relative '../app'

Capybara.app = App

feature "Menu Site" do
  scenario "User can open the homepage" do
    visit '/'

    expect(page).to have_content("Menu")


  end
end