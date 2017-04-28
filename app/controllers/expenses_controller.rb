class ExpensesController < ApplicationController
  def new
    @expense = Expense.new(expense_params)
  end

  def create
    @expense = Expense.new(expense_params)
    if @expense.save
      flash[:success] = "Expense successfully created"
      redirect_to user_path(params[:user_id])
    else
      flash[:error] = "Expense was not created"
      redirect_to user_path(params[:user_id])
    end
  end

  def edit
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
      flash[:success] = "Expense successfully deleted!"
      redirect_to user_path
    end
  end


  private

  def expense_params
    params.require(:expense).permit(:amount, :time_date, :description, :user_id)
  end

end
