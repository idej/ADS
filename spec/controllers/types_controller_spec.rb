require 'spec_helper'

describe TypesController do

  # This should return the minimal set of attributes required to create a valid
  # Type. As you add validations to Type, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end
  
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # TypesController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  before(:each) do
    @user = FactoryGirl.create(:user)
    test_sign_in(@user)
    @user.role = :admin
  end

  describe "GET index" do
    it "assigns all types as @types" do
      type = Type.create! valid_attributes
      get :index, {}, valid_session
      assigns(:types).should eq([type])
    end
  end

  describe "GET show" do
    it "assigns the requested type as @type" do
      type = Type.create! valid_attributes
      get :show, {:id => type.to_param}, valid_session
      assigns(:type).should eq(type)
    end
  end

  describe "GET new" do
    it "assigns a new type as @type" do
      get :new, {}, valid_session
      assigns(:type).should be_a_new(Type)
    end
  end

  describe "GET edit" do
    it "assigns the requested type as @type" do
      type = Type.create! valid_attributes
      get :edit, {:id => type.to_param}, valid_session
      assigns(:type).should eq(type)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Type" do
        expect {
          post :create, {:type => valid_attributes}, valid_session
        }.to change(Type, :count).by(1)
      end

      it "assigns a newly created type as @type" do
        post :create, {:type => valid_attributes}, valid_session
        assigns(:type).should be_a(Type)
        assigns(:type).should be_persisted
      end

      it "redirects to the created type" do
        post :create, {:type => valid_attributes}, valid_session
        response.should redirect_to(Type.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved type as @type" do
        # Trigger the behavior that occurs when invalid params are submitted
        Type.any_instance.stub(:save).and_return(false)
        post :create, {:type => {}}, valid_session
        assigns(:type).should be_a_new(Type)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Type.any_instance.stub(:save).and_return(false)
        post :create, {:type => {}}, valid_session
        response.should redirect_to(types_path)
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested type" do
        type = Type.create! valid_attributes
        # Assuming there are no other types in the database, this
        # specifies that the Type created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Type.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => type.to_param, :type => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested type as @type" do
        type = Type.create! valid_attributes
        put :update, {:id => type.to_param, :type => valid_attributes}, valid_session
        assigns(:type).should eq(type)
      end

      it "redirects to the type" do
        type = Type.create! valid_attributes
        put :update, {:id => type.to_param, :type => valid_attributes}, valid_session
        response.should redirect_to(type)
      end
    end

    describe "with invalid params" do
      it "assigns the type as @type" do
        type = Type.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Type.any_instance.stub(:save).and_return(false)
        put :update, {:id => type.to_param, :type => {}}, valid_session
        assigns(:type).should eq(type)
      end

      it "re-renders the 'edit' template" do
        type = Type.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Type.any_instance.stub(:save).and_return(false)
        put :update, {:id => type.to_param, :type => {}}, valid_session
        response.should redirect_to(type)
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested type" do
      type = Type.create! valid_attributes
      expect {
        delete :destroy, {:id => type.to_param}, valid_session
      }.to change(Type, :count).by(-1)
    end

    it "redirects to the types list" do
      type = Type.create! valid_attributes
      delete :destroy, {:id => type.to_param}, valid_session
      response.should redirect_to(types_url)
    end
  end

end
