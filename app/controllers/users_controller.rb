class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  def new
    @user = User.new
  end
  def show
     @user = User.find(params[:id])
     @recipes = @user.recipes.paginate(page: params[:page])
  end
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Successful Login"
      redirect_to home_url(@user)
    else
      render 'new'
    end
  end
  def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
  end
  private
  def user_params
    params.require(:user).permit(:username, :email, :password,
                                   :password_confirmation, :image)
  end
end