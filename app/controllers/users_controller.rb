class UsersController < ApplicationController
  respond_to :html
  load_and_authorize_resource

  def create
    @user = user.new(params[:user])
    flash[:notice] = "User was successfully created." if @user.save
    respond_with(@user)
  end

  def update
    flash[:notice] = "Update was successfully." if @user.update_attributes(params[:user])
    respond_with @user
  end

  def destroy
    @user.destroy
    flash[:notice] = "Successfully destroyed advertisement."
    respond_with @user
  end


end
