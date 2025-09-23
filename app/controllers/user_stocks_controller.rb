class UserStocksController < ApplicationController
  def create
    stock = Stock.find_by(ticker: params[:ticker])
    if !stock
      stock = Stock.new_lookup(params[:ticker])
      stock.save
    end

    # user_stock = UserStock.create(user: current_user, stock: stock)
    UserStock.create(user: current_user, stock: stock)

    flash[:notice] = "Stock #{stock.name} was added to your portfolio!"
    redirect_to portfolio_path
  end

  def destroy
    stock_id = params[:id]
    user_id = current_user.id
    UserStock.destroy_by(stock_id: stock_id, user_id: user_id)
    stock = Stock.find(stock_id)
    flash[:notice] = "#{stock.ticker} was removed to your portfolio!"
    redirect_to portfolio_path
  end
end
