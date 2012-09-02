class AdvertisementsController < ApplicationController
  respond_to :html
  load_and_authorize_resource :only => [:new,:destroy,:edit,:update]

  def index
    @advertisements = Advertisement.all
    respond_with @advertisements #index.html.erb
  end

  def new
    types = Type.all
    @type_array = Array.new
    types.each do |t|
      @type_array << [t.type_name, t.id]
    end
  end

  def edit
    types = Type.all
    @type_array = Array.new
    types.each do |t|
      @type_array << [t.type_name, t.id]
    end
  end

  def show
    @advertisement = Advertisement.find(params[:id])
    respond_with @advertisement # show.html.erb
  end

  def create
    @advertisement = current_user.advertisements.new(params[:advertisement])
    flash[:notice] = "Advertisement was successfully created." if @advertisement.save
    respond_with(@advertisement)
  end

  def update
    flash[:notice] = "Update was successfully." if @advertisement.update_attributes(params[:advertisement])
    respond_with @advertisement
  end

  def destroy
    @advertisement.destroy
    flash[:notice] = "Successfully destroyed advertisement."
    respond_with @advertisement
  end
end
