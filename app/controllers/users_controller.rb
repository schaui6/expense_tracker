class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
    if @user.blank? || current_user.id != @user.id
      redirect_to current_user
    else
      @user_expenses = @user.expenses
      @all_expenses = Expense.all
      @new_expense = Expense.new
    end
  end

  def current_user_home
    redirect_to current_user
  end
end
