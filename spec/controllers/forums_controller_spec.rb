require 'spec_helper'

describe ForumsController do
  render_views

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
      p @controller
      #@user = Factory.create :admin
      @user = User.create!(username: "Test", password: "secret", email: "test@test.com")
      p @user.inspect
      login_user @user
      it 'should resolve' do
        get :new
        response.should render_template(:new)
      end
    end

  end

end
