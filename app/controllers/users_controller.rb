class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
    @expenses = @user.expenses
  end

  def current_user_home
    redirect_to current_user
  end
  
end
