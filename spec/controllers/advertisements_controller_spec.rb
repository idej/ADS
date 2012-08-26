require 'spec_helper'

def valid_attributes
  {
    :content => "car",
    :phone_number => '5734654'
  }
end

describe AdvertisementsController do

  before(:each) do
    @user = FactoryGirl.create(:user)
    test_sign_in(@user)
  end

  describe "GET index" do
    before(:each) do
      @advertisement = FactoryGirl.create(:advertisement)
    end

    it "assigns all advertisements as @advertisements for users" do
      get :index
      assigns(:advertisements).should eq([@advertisement])
    end

    it "assigns all advertisements as @advertisements for guests" do
      controller.sign_out(@user)
      get :index
      assigns(:advertisements).should eq([@advertisement])
    end

    it "assigns all advertisements as @advertisements for admins" do
      @user.role = :admin
      get :index
      assigns(:advertisements).should eq([@advertisement])
    end
  end

  describe "GET show" do
    before(:each) do
      @advertisement = FactoryGirl.create(:advertisement)
    end

    it "assigns the requested advertisement as @advertisement" do
      get :show, {:id => @advertisement.to_param}
      assigns(:advertisement).should eq(@advertisement)
    end

    it "assigns the requested advertisement as @advertisement for admins" do
      @user.role = :admin
      get :show, {:id => @advertisement.to_param}
      assigns(:advertisement).should eq(@advertisement)
    end

    it "assigns the requested advertisement as @advertisement for users" do
      controller.sign_out(@user)
      get :show, {:id => @advertisement.to_param}
      assigns(:advertisement).should eq(@advertisement)
    end
  end

  describe "GET new" do
    it "assigns a new advertisement as @advertisement" do
      get :new, {}
      assigns(:advertisement).should be_a_new(Advertisement)
    end

    it "should redirect to root_path if user have admin role" do
      @user.role = :admin
      get :new, {}
      response.should redirect_to(root_path)
    end

    it "should redirect to root_path if user have guest role" do
      controller.sign_out(@user)
      get :new, {}
      response.should redirect_to(root_path)
    end
  end

  describe "GET edit" do
    it "assigns the requested advertisement as @advertisement" do
      advertisement = FactoryGirl.create(:advertisement)
      @user.advertisements << advertisement
      get :edit, {:id => advertisement.to_param}
      assigns(:advertisement).should eq(advertisement)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Advertisement" do
        expect {
          post :create, {:advertisement => valid_attributes}
        }.to change(Advertisement, :count).by(1)
      end

      it "assigns a newly created advertisement as @advertisement" do
        post :create, {:advertisement => valid_attributes}
        assigns(:advertisement).should be_a(Advertisement)
        assigns(:advertisement).should be_persisted
      end

      it "redirects to the created advertisement" do
        post :create, {:advertisement => valid_attributes}
        response.should redirect_to(Advertisement.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved advertisement as @advertisement" do
        Advertisement.any_instance.stub(:save).and_return(false)
        post :create, {:advertisement => {}}
        assigns(:advertisement).should be_a_new(Advertisement)
      end

      it "re-renders the 'new' template" do
        Advertisement.any_instance.stub(:save).and_return(false)
        post :create, {:advertisement => {}}
        response.should redirect_to('/advertisements')
      end
    end
  end

  describe "PUT update" do
    before(:each) do
      @advertisement = FactoryGirl.create(:advertisement)
      @user.advertisements << @advertisement
    end
    describe "with valid params" do
      it "updates the requested advertisement" do
        Advertisement.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => @advertisement.to_param, :advertisement => {'these' => 'params'}}
      end

      it "assigns the requested advertisement as @advertisement" do
        put :update, {:id => @advertisement.to_param, :advertisement => valid_attributes}
        assigns(:advertisement).should eq(@advertisement)
      end

      it "redirects to the advertisement" do
        put :update, {:id => @advertisement.to_param, :advertisement => valid_attributes}
        response.should redirect_to(@advertisement)
      end
    end

    describe "with invalid params" do
      it "assigns the advertisement as @advertisement" do
        Advertisement.any_instance.stub(:save).and_return(false)
        put :update, {:id => @advertisement.to_param, :advertisement => {}}
        assigns(:advertisement).should eq(@advertisement)
      end

      it "re-renders the 'edit' template" do
        Advertisement.any_instance.stub(:save).and_return(false)
        put :update, {:id => @advertisement.to_param, :advertisement => {}}
        response.should redirect_to(@advertisement)
      end
    end
  end

  describe "DELETE destroy" do
    before(:each) do
      @advertisement = FactoryGirl.create(:advertisement)
    end

    it "destroys the requested advertisement" do
      @user.role = :admin
      expect {
        delete :destroy, {:id => @advertisement.to_param}
      }.to change(Advertisement, :count).by(-1)
    end

    it "redirects to the advertisements list" do
      @user.role = :admin
      delete :destroy, {:id => @advertisement.to_param}
      response.should redirect_to(advertisements_url)
    end

    it "redirect to root_path without admin with user ability" do
      delete :destroy, {:id => @advertisement.to_param}
      response.should redirect_to(root_path)
    end

    it "redirect to root_path without admin with guest ability" do
      controller.sign_out(@user)
      advertisement = FactoryGirl.create(:advertisement)
      delete :destroy, {:id => advertisement.to_param}
      response.should redirect_to(root_path)
    end
  end
end
