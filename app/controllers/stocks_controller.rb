class StocksController < ApplicationController
  def search
    respond_to do |format|
      ### format.js { render(partial: "users/result") }
      ### When the format is of type js
      ### Call the 'render' method with the argument 'partial' hash
      ### the { } after the format is an 'inline' block of code (as opposed to the do...end pair)
      ### The partial that this is referring to in a javascript.erb file

      # Check for empty string
      if params[:stock].present?
        @stock = Stock.new_lookup(params[:stock])

        if @stock
          format.js { render(partial: "users/result") }
        else
          flash.now[:alert] = "Cannot find stock with symbol <#{params[:stock]}>"
          format.js { render(partial: "users/result") }
        end
      else
        flash.now[:alert] = "Please enter a ticker symbol!"
        format.js { render(partial: "users/result") }
      end
    end # respond_to
  end
end
