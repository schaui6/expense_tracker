require 'spec_helper'

feature 'Expenses' do

  let(:user) { User.create(email: 'user@gmail.com', password: 'password') }
  let(:admin) { User.create(email: 'admin@gmail.com', password: 'password', admin: true) }

  scenario 'user create an expense' do
    login_user
    create_expense
    page.should have_content '04/01/2017'
  end

  scenario 'user can delete an expense' do
    login_user
    create_expense
    click_link 'delete'
    page.should have_no_content '04/01/2017'
  end

  def login_user
    visit root_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
  end

  def create_expense
    fill_in 'description', with: 'lunch with client'
    fill_in 'amount', with: 30.87
    fill_in 'date', with: '04/01/2017'
    fill_in 'time', with: '01:00PM'
  end

end