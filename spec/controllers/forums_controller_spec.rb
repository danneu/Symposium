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

  def assert_deny
    flash[:alert].should =~ /Access Denied/
    response.should redirect_to(root_path)
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
        assert_deny
      end
    end
    describe "GET edit" do
      it "should deny" do
        get :edit
        assert_deny
      end
    end
    describe "GET show" do
      it "should resolve" do
        forum = Factory :forum
        get :show, id: forum.id
        response.should render_template(:show)
      end
    end
    describe "POST create" do
      it "should deny" do
        post :create, forum: Factory.build(:forum).attributes
        assert_deny
      end
    end
    describe "PUT update" do
      it "should deny" do
        forum = Factory :forum
        put :update, id: forum.id, forum: forum.attributes.merge(name: "New Name")
        assert_deny
      end
    end
    describe "DELETE destroy" do
      it "should deny" do
        forum = Factory :forum
        delete :destroy, id: forum.id
        assert_deny
      end

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
      it "should create and redirect" do
        forum_count = Forum.count
        forum = Factory.build :forum
        post :create, forum: forum.attributes
        Forum.count.should == (forum_count + 1)
        response.should redirect_to(Forum.last)
      end
    end
    describe "PUT update" do
      it "should resolve" do
        forum = Factory :forum
        put :update, id: forum.id, forum: forum.attributes.merge(name: "New Name")
        Forum.last.name.should == "New Name"
        response.should redirect_to(forum)
      end
    end
    describe "DELETE destroy" do
      it "should successfully destroy and return to root" do
        forum = Factory :forum
        forums_count = Forum.count
        delete :destroy, id: forum.id
        Forum.count.should == (forums_count - 1)
        response.should redirect_to(root_path)
      end
    end
  end

end
