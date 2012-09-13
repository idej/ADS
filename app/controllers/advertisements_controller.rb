class AdvertisementsController < ApplicationController
  respond_to :html, :js
  load_and_authorize_resource :only => [:new,:destroy,:edit,:update]

  def index
    @advertisements = Advertisement.all
    respond_with @advertisements #index.html.erb
  end

  def show
    @advertisement = Advertisement.find(params[:id])
    respond_with @advertisement # show.html.erb
  end

  def create
    @advertisement = current_user.advertisements.new(params[:advertisement])
    @advertisement.to_new! if params[:advertisement][:state] == 'new'
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

  def change_state
    @advertisement = Advertisement.find_by_id(params[:id])
    case params[:state]
      when 'new'
        @advertisement.to_new!
      when 'draft'
        @advertisement.to_drafts!
      when 'approve'
        @advertisement.approve!
      when 'cancel'
        @advertisement.cancel!
      when 'published'
        @advertisement.publish!
      when 'archived'
        @advertisement.archive!
    end
    @states = @advertisement.possible_states(current_user)
  end
end
