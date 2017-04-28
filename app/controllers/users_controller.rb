class UsersController < ApplicationController
  def show
    # p params
    @user = User.find_by(id: params[:id])
    @expenses = @user.expenses
    p '*'*100
    p @expenses[0].amount
    p '*'*100
  end
end
