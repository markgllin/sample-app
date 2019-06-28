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
    @user = User.new(params[:user])
    if @user.save
      # handle successful save
    else
      render 'new'
    end
  end
end

# https://www.railstutorial.org/book/sign_up#fig-signup_failure_rails_debug