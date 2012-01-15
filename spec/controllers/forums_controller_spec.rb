require 'spec_helper'

describe ForumsController, :type => :controller do
  render_views

  #describe "GET new" 
  #describe "GET edit"
  #describe "GET show"
  #describe "POST create"
  #describe "PUT update"
  #describe "DELETE destroy"

  before(:all) do
    User.destroy_all
    @member = Factory :member
    @admin = Factory :admin
    @admin.role = "admin"
    @admin.save
    @forum = Factory :forum
  end

  describe 'GET index' do
    it 'should resolve' do
      get :index
      response.should be_success
    end
  end

  describe 'when guest' do
    describe "GET new" do
      it "should redirect to root" do
        get :new
        response.should redirect_to(root_path)
      end
    end
    describe "GET edit" do
      it "should deny" do
        get :edit
        response.should redirect_to(root_path)
      end
    end
    describe "GET show" do
      it "should resolve"
    end
    describe "POST create" do
      it "should deny"
    end
    describe "PUT update" do
      it "should deny"
    end
    describe "DELETE destroy" do
      it "should deny"
    end
  end


  describe "when admin" do
    #before(:all) do   <-- Throws an error. Guess we'll do :each.
      #sign_in @admin
    #end
    before(:each) do
      sign_in @admin
    end

    describe "GET new" do
      it "should resolve" do
        get :new
        response.should render_template(:new)
      end
    end
    describe "GET edit" do
      it "should resolve" do
        get :edit, id: @forum.id
        response.should render_template(:edit)
      end
    end
    describe "GET show" do
      it "should resolve" do
        get :show, id: @forum.id
        response.should render_template(:show)
      end
    end
    describe "POST create" do
      #it "should resolve" do
        #post :create, forum: Factory.build(:forum)
        #response.should render_template(:index)
      #end
    end
    describe "PUT update" do
      it "should resolve"
    end
    describe "DELETE destroy" do
      it "should resolve"
    end
  end

end
