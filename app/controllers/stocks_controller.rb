class StocksController < ApplicationController
  def search
    # Check for empty string
    if params[:stock].present?
      @stock = Stock.new_lookup(params[:stock])
      if @stock
        render "users/portfolio"
      else
        flash[:alert] = "Cannot find stock with symbol <#{params[:stock]}>"
        redirect_to portfolio_path
      end
    else
      flash[:alert] = "Please enter a ticker symbol!"
      redirect_to portfolio_path
    end
  end
end
