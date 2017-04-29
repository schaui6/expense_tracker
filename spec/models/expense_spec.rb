require 'rails_helper'

RSpec.describe Expense, type: :model do

  let(:expense) {Expense.new(
      description: 'RubyCon 2017 tickets',
      user_id: 1,
      amount: 30.01,
      date: Date.today,
      time: Time.now,
  )}

  # ActiveRecord Tests
  describe 'ActiveRecord associations' do

    it 'Expense belongs to users' do
      expect(Expense.reflect_on_association(:user).macro).to be (:belongs_to)
    end

    it 'Expense has many user\'s in plural name' do
      expect(Expense.reflect_on_association(:user).plural_name).to eq ("users")
    end

  end

  it "is invalid without a description" do
    expense = Expense.new(description: nil)
    expense.valid?
    expect(expense.errors[:description]).to include("can't be blank")
  end

  it "is invalid without a user_id" do
    expense = Expense.new(user_id: nil)
    expense.valid?
    expect(expense.errors[:user_id]).to include("can't be blank")
  end

  it "is invalid without a amount" do
    expense = Expense.new(amount: nil)
    expense.valid?
    expect(expense.errors[:amount]).to include("can't be blank")
  end

  it "is invalid without a date" do
    expense = Expense.new(date: nil)
    expense.valid?
    expect(expense.errors[:date]).to include("can't be blank")
  end

  it "is invalid without a time" do
    expense = Expense.new(time: nil)
    expense.valid?
    expect(expense.errors[:time]).to include("can't be blank")
  end

  it "returns an expense's description as a string type" do
    expect(expense.description).to be_a_kind_of(String)
  end

  it "returns an expense's user_id as an integer" do
    expect(expense.user_id).to be_a_kind_of(Integer)
  end

  it "returns an expense's amount as a decimal" do
    expect(expense.amount).to be_a_kind_of(BigDecimal)
  end

  it "returns an expense's time as a string" do
    expect(expense.time).to be_a_kind_of(Time)
  end

  it "returns an expense's date as a date" do
    expect(expense.time).to be_a_kind_of(Time)
  end
end
