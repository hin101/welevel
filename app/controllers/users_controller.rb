class UsersController < ApplicationController
  helper_method :user

  # POST /users
  def create
    if update_user.save
      redirect_to user, notice: 'User was successfully created.'
    else
      redirect_to new_path, notice: user.errors.full_messages.join(', ')
    end
  end

  # PATCH/PUT /users/1
  def update
    if update_user.save
      redirect_to user, notice: 'User was successfully updated.'
    else
      redirect_to user, notice: user.errors.full_messages.join(', ')
    end
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
    end
  end

  def user_params
    params.require(:user).permit(:email, :firstname, :last_name)
  end
end
