class AdvertisementsController < ApplicationController
  respond_to :html
  load_and_authorize_resource :only => [:new,:destroy,:edit,:update]

  def index
    @advertisements = Advertisement.all
    respond_with @advertisements # index.html.erb
  end

  def show
    @advertisement = Advertisement.find(params[:id])
    respond_with @advertisement # show.html.erb
  end

  def new
    @advertisement = Advertisement.new
    respond_with @advertisement # new.html.erb
  end

  def edit
    @advertisement = Advertisement.find(params[:id])
    respond_with @advertisement
  end

  def create
    @advertisement = current_user.advertisements.new(params[:advertisement])
    flash[:notice] = "Advertisement was successfully created." if @advertisement.save
    respond_with(@advertisement)
  end

  def update
    @advertisement = Advertisement.find(params[:id])
    flash[:notice] = "Advertisement was successfully updated." if @advertisement.update_attributes(params[:advertisement])
    respond_with @advertisement
  end

  def destroy
    @advertisement = Advertisement.find(params[:id])
    @advertisement.destroy
    flash[:notice] = "Successfully destroyed advertisement."
    respond_with @advertisement
  end
end
