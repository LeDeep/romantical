require 'spec_helper'

describe CouplesController do
  let(:user1) {FactoryGirl.create(:user)}
  let(:user2) {FactoryGirl.create(:user)}
  let(:valid_session) {{'user_id' => user1.id}}
  let(:invalid_session) {{"user_id" => ""}}
 

  context 'routes' do 
    it {should route(:get, '/couples/new').to :action => :new}
    it {should route(:post, '/couples').to :action => :create}
    it {should route(:get, '/couples/1').to :action => :show, :id => 1}
    it {should route(:get, '/couples').to :action => :index}
    it {should route(:get, '/couples/1/edit').to :action => :edit, :id => 1}
    it {should route(:delete, '/couples/1').to :action => :destroy, :id => 1}
  end


  context 'GET new' do
    context 'valid_sesssion' do 
      before {get :new, {}, valid_session}
      it {should render_template :new}
    end
    
    context 'invalid_session' do 
      before {get :new, {}, invalid_session}
      it {should redirect_to root_path}
    end
  end

  context 'POST create' do

  end
  context 'GET edit' do
  end
  context 'PUT update' do
  end
  context 'DELETE destroy' do
  end

end