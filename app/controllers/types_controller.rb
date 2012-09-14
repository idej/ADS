class TypesController < ApplicationController
  respond_to :html
  load_and_authorize_resource

  def create
    @type = Type.new(params[:type])
    flash[:notice] = "Type was successfully created." if @type.save
    respond_with @type
  end

  def update
    @type = Type.find(params[:id])
    flash[:notice] = "Type was successfully updated." if @type.update_attributes(params[:type])
    respond_with @type
  end

  def destroy
    @type.destroy
    flash[:notice] = "Successfully destroyed type."
    respond_with @type
  end
end
