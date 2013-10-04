require 'spec_helper'

describe UsersController do

  describe "GET #show" do
    let(:valid_params) { {:email => "thomas@me.com", :password => "123notit"} }
    let(:member) { FactoryGirl.create :member }
    context "when not signed in" do
      it "should redirect to new_user_path" do
        controller.stub :signed_in? => false
        get :show, :id => member.id
        response.should redirect_to new_user_path
      end
    end

    context "when signed in" do
      it "should render the member's show template" do
        controller.stub :current_user => member # stub in signed_in? ...instead?
        get :show, :id => member.id
        response.should render_template("show")
      end
    end
  end

  describe "GET new" do
    it "renders the new_template" do
      get :new
      expect(response).to render_template('new')
    end
  end

  describe "POST #create" do
    let(:valid_params) { { first_name: 'Ian', last_name: 'Root', email: 'ianroot@gmail.com', password: 'newshark', password_confirmation: 'newshark'} }
    let(:invalid_params) { {first_name: '' , last_name: '', email: ''} }

    context "with valid params" do
      it "creates a new member" do
        expect{
          post :create, :user => valid_params
        }.to change{ User.count }.by(1)
      end
      it "redirects to users show page" do
        post :create, :user => valid_params
        response.should redirect_to user_path(User.last)
      end
    end

    context "with invalid_params" do
      it "does not create member" do
        expect{
          post :create, :member => invalid_params
        }.to_not change{ User.count }
      end
      it "redirects to new member route" do
        post :create, :member => invalid_params
        response.should redirect_to new_user_path
      end
    end
  end

  describe "GET show" do
    let(:user) { FactoryGirl.create :user }
    before { controller.stub :signed_in? => true }
    before { controller.stub :current_user => user }

    it "assigns @member" do
      get :show, :id => member.id
      expect(assigns(:user)).to be_a User
    end

    it "assigns @channel" do
      get :show, :id => member.id
      expect(assigns(:channel)).to be_an_instance_of Channel
    end
  end

end
