class UsersController < ApplicationController
  def portfolio
  end

  def update
    debugger
    params.require(:user).permit(:email, :password, :first_name, :last_name)
    flash[:notice] = params
    redirect_to portfolio_path
  end
end
