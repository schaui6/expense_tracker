class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
    if @user.blank? || current_user.id != @user.id
      redirect_to current_user
    else
      @user_expenses = @user.expenses
      @all_expenses = Expense.all
      p '*'*100
      # p @user_expenses.reports 
      # @transactions = @all_expenses.where(date: report.start_date..report.end_date)
      @new_expense = Expense.new
      @new_report = Report.new
      @all_user_reports = @user.reports

    end
  end

  def current_user_home
    redirect_to current_user
  end
end
