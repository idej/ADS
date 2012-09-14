class AdvertisementsController < ApplicationController
  respond_to :html, :js
  load_and_authorize_resource

  def index
    @advertisements = Advertisement.accessible_by(current_ability).page params[:page]
    respond_with @advertisements
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
    end
    @states = @advertisement.possible_states(current_user)
  end
end

