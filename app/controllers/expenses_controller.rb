class ExpensesController < ApplicationController

  def create
    expense = Expense.new(user_id: params[:user_id], 
                          description: params[:expense][:description], 
                          amount: params[:expense][:amount], 
                          date: params[:expense][:date], 
                          time: params[:expense][:time])
    
    redirect_to current_user if expense.save
  end


  def update
    expense = Expense.find_by(id: params[:id])
    attribute_name = params[:expense].keys.first
    attribute_val = params[:expense]

    change_attribute_value(expense, attribute_name, attribute_val)

    redirect_to current_user
  end

  def destroy
    expense = Expense.find_by(id: params[:id])

    redirect_to current_user if expense.destroy 
  end

  private

  def change_attribute_value(exp, key, val) 
    props = ['description','date', 'amount', 'time']

    props.each do |ans|
      if ans == key
        exp[ans] = val[ans]
        exp.save
      end
    end
  end


end
