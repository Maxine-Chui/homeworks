class UsersController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.new(user_params)
    @user.save!
    log_in_user!(@user)
    redirect_to bands_url
  end



  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
