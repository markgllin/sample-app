class UsersController < ApplicationController
  # this creates a form for the user object @ /users/new
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  # this is called by POST-ing to /users (done by new.html.erb view)
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'Welcome to the Sample App!'
      redirect_to @user
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end