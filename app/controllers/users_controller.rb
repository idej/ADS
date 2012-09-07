class UsersController < ApplicationController
  respond_to :html
  load_and_authorize_resource

  def create
    @user = user.new(params[:user])
    @user.role = :user
    flash[:notice] = "User was successfully created." if @user.save
    respond_with(@user)
  end

  def update
    @user.role = params[:user][:role] if can? :change_role, @user
    flash[:notice] = "Update was successfully." if @user.update_attributes(params[:user])
    respond_with @user
  end

  def destroy
    @user.destroy
    flash[:notice] = "Successfully destroyed advertisement."
    respond_with @user
  end
end
