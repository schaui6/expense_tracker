require 'spec_helper'
require 'factory_girl_rails'

feature 'User login' do

  let(:user) { User.create(email: 'user@gmail.com', password: 'password') }
  let(:admin) { User.create(email: 'admin@gmail.com', password: 'password', admin: true) }

  scenario 'user is directed to login as root path' do
    visit root_path
    page.should have_content 'Sign up'
  end

  scenario 'user logs into site' do
    visit root_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    page.should have_content 'Log Off'
  end

  scenario 'admin can read all user expenses' do
    visit root_path
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Log in'
    page.should have_content 'ALL Expenses'
  end

end