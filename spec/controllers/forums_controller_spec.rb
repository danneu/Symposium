require 'spec_helper'

describe ForumsController, :type => :controller do
  render_views
  
  before(:all) do
    User.destroy_all
    @member = Factory :member
    @admin = Factory :admin
    @admin.role = "admin"
    @admin.save
  end

  describe 'GET index' do
    it 'should resolve' do
      get :index
      response.should be_success
    end
  end

  describe 'GET new' do
    describe 'when guest' do
      it 'should deny and redirect' do
        get :new
        response.should redirect_to(root_path)
      end
    end

    describe 'when admin' do
      before(:each) do
        sign_in @admin
        puts @admin.inspect
      end
      it 'should resolve' do
        get :new
        response.should render_template(:new)
      end
    end

  end

end
