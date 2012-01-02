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
      it 'should resolve'
    end

  end

end
