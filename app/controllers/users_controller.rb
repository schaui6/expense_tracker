class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
    @user_expenses = @user.expenses
    @all_expenses = Expense.all
    @new_expense = Expense.new()
  end

  def current_user_home
    redirect_to current_user
  end
end
