class ExpensesController < ApplicationController
  def new
  end

  def create
    expense = Expense.new(user_id: params[:user_id], description: params[:expense][:description], amount: params[:expense][:amount], date: params[:expense][:date], time: params[:expense][:time])
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

    props = ['description','date', 'amount', 'time']
    key = params[:expense].keys.first

    props.each do |ans|
      if ans == key
        @expense[ans] = params[:expense][ans]
        @expense.save
      end
    end
    redirect_to user_path(@user)
  end

  def destroy
    @expense = Expense.find_by(id: params[:id])
    @user = User.find_by(id: params[:user_id])
    if @expense.destroy
      redirect_to user_path(@user)
    end
  end


end
