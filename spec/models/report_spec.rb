require 'rails_helper'

RSpec.describe Report, type: :model do

  let(:report) {Report.new(
      start_date: 30.day.ago,
      end_date: Date.today,
      total: 50.01,
      user_id: 1,
  )}

  # ActiveRecord Tests
  describe 'ActiveRecord associations' do

    it 'Report belongs to users' do
      expect(Report.reflect_on_association(:user).macro).to be (:belongs_to)
    end

    it 'Report has many user\'s in plural name' do
      expect(Report.reflect_on_association(:user).plural_name).to eq ("users")
    end

  end

  it "is invalid without a start_date" do
    report = Report.new(start_date: nil)
    report.valid?
    expect(report.errors[:start_date]).to include("can't be blank")
  end

  it "is invalid without a end_date" do
    report = Report.new(end_date: nil)
    report.valid?
    expect(report.errors[:end_date]).to include("can't be blank")
  end

  it "is invalid without a user_id" do
    report = Report.new(user_id: nil)
    report.valid?
    expect(report.errors[:user_id]).to include("can't be blank")
  end

  it "is invalid without a total" do
    report = Report.new(total: nil)
    report.valid?
    expect(report.errors[:total]).to include("can't be blank")
  end

  it "returns an report's start date as a date" do
    expect(report.start_date).to be_a_kind_of(Date)
  end

  it "returns an report's end date as a date" do
    expect(report.end_date).to be_a_kind_of(Date)
  end

  it "returns an report's user_id as an integer" do
    expect(report.user_id).to be_a_kind_of(Integer)
  end

  it "returns an report's total as a Big decimal" do
    expect(report.total).to be_a_kind_of(BigDecimal)
  end

end
