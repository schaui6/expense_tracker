class ExpensesController < ApplicationController
  def new
  end

  def create
    expense = Expense.new(user_id: params[:user_id], description: params[:expense][:description], amount: params[:expense][:amount], date_time: params[:expense][:date_time])
    if expense.save
      redirect_to user_path(params[:user_id])
    else
      redirect_to user_path(params[:user_id])
    end
  end

  def edit
    @user = User.find_by(id: params[:user_id])
  end

  def update
    @expense = Expense.find_by(id: params[:id])
    @user = User.find_by(id: params[:user_id])
    if @expense.update(expense_params)
      flash[:success] = "Expense successfully updated!"
      redirect_to user_path(@user)
    else
      flash[:error] = "You're missing a field."
      redirect_to edit_user_expense_path(@user, @expense)
    end
  end

  def destroy
    @expense = Expense.find_by(id: params[:id])
    @user = User.find_by(id: params[:user_id])
    if @expense.destroy
      redirect_to user_path(@user)
    end
  end


  private

  # def expense_params
  #   params.require(:expense).permit(:amount, :date_time, :description, :user_id)
  # end

end
