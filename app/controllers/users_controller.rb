class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]

  def new
    @user = User.new    
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update_attributes! user_params
    redirect_to edit_user_path(@user), notice: "Changes saved"
  end
  
  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirm, :name)
  end
end
