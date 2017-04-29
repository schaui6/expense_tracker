require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) {User.new(
      email: 'test@gmail.com',
      encrypted_password: '$##)@((SK<llc0',

  )}

  # ActiveRecord Tests
  describe 'ActiveRecord associations' do

    it 'User has many expenses' do
      expect(User.reflect_on_association(:expenses).macro).to be (:has_many)
    end

    it 'User has many expenses\' in plural name' do
      expect(User.reflect_on_association(:expenses).plural_name).to eq ("expenses")
    end

    it 'User has many reports' do
      expect(User.reflect_on_association(:reports).macro).to be (:has_many)
    end

    it 'User has many reports\' in plural name' do
      expect(User.reflect_on_association(:reports).plural_name).to eq ("reports")
    end

  end

  it "is invalid without a email" do
    user = User.new(email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it "is invalid without a password" do
    user = User.new(encrypted_password: nil)
    user.valid?
    expect(user.errors[:encrypted_password]).to include("can't be blank")
  end

  it "returns an user's email as a string" do
    expect(user.email).to be_a_kind_of(String)
  end

  it "returns an user's password as a string" do
    expect(user.encrypted_password).to be_a_kind_of(String)
  end

  it "is invalid with a duplicate email address" do
    User.create(
      email: 'user@gmail.com',
      password: 'password')
    user = User.new(
      email: 'user@gmail.com',
      password: 'password')
    user.valid?
    expect(user.errors[:email]).to include('has already been taken')
  end

end
