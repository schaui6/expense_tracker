class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])

    # Prevents users to goto another users page 
    # or a user that doesn't by changing user's id # in url
    if @user.blank? || current_user.id != @user.id
      redirect_to current_user
    else
      @all_expenses = Expense.all
      @new_expense = Expense.new
      @new_report = Report.new
    end
  end

  def current_user_home
    redirect_to current_user
  end
end
