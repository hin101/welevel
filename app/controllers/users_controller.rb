class UsersController < ApplicationController
  helper_method :user

  # GET /users
  def index
  end

  # GET /users/1
  def show
  end

  # GET /users/new
  def new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    update_user
    redirect_to user, notice: 'User was successfully created.'
  end

  # PATCH/PUT /users/1
  def update
    update_user
    redirect_to user, notice: 'User was successfully updated.'
  end

  # DELETE /users/1
  def destroy
    user.destroy unless user.is_admin?
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private

  def user
    @user ||= params[:id].presence ? User.find(params[:id]) : User.new
  end

  def update_user
    user.tap do |u|
      u.assign_attributes(user_params)
      u.save!
    end
  end

  def user_params
    params.require(:user).permit(:email, :firstname, :last_name)
  end
end
