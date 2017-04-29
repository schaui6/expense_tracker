require 'spec_helper'

feature 'User login/logout' do

  let(:user) { User.create(email: 'user@gmail.com', password: 'password') }
  let(:admin) { User.create(email: 'admin@gmail.com', password: 'password', admin: true) }

  scenario 'user is directed to login as root path' do
    visit root_path
    page.should have_content 'Sign up'
  end

  scenario 'user logs into site' do
    login_user
    page.should have_content 'Log Off'
  end

  scenario 'user logs into site' do
    login_user
    click_link 'Log Off'
    page.should have_content 'Log in'
  end

  scenario 'admin can read all user expenses' do
    login_admin
    page.should have_content 'ALL Expenses'
  end

  def login_user
    visit root_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
  end

  def login_admin
    visit root_path
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Log in'
  end
end