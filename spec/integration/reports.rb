require 'spec_helper'

feature 'Reports' do

  let(:user) { User.create(email: 'user@gmail.com', password: 'password') }

  scenario 'user can create a report' do
    login_user
    create_report
    page.should have_content '05/01/2017'
  end

  def login_user
    visit root_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
  end

  def create_report
    fill_in 'start date', with: '04/01/2017'
    fill_in 'end_date', '05/01/2017'
    click_button 'generate a report'
  end

end