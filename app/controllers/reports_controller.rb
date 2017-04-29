class ReportsController < ApplicationController
  def create
    expenses = Expense.where(user_id: params[:user_id])
    report = Report.new(user_id: params[:user_id], start_date: params[:start_date][:date], end_date: params[:end_date][:date], total: calculate_total(expenses))

    redirect_to current_user if report.save
  end

  private

  def calculate_total(expenses_array)
    total = 0.00

    expenses_array.each do |expense|
      total+=expense.amount
    end

    return total
  end
end
