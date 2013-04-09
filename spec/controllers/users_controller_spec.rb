require 'spec_helper'

describe UsersController do

let(:user) {FactoryGirl.create :user}

  context 'routing' do
    it {should route(:get, '/users/new').to :action => :new}    
    it {should route(:post, '/users').to :action => :create}
    it {should route(:put, '/users/1').to :action => :update, :id => 1}
    it {should route(:delete, '/users/1').to :action => :destroy, :id => 1}
    it {should route(:get, '/users').to :action => :index}
  end

  context 'GET new' do
    before {get :new}

    it {should render_template :new}
  end

  context 'POST create' do
    before {post :create}
    it {should redirect_to root_path}
  end

  # context 'GET index' do
  #   before {get :index}

  #   it {should redirect_to root_path}
  # end

  # context 'PUT update' do
  #   context 'with valid parameters' do
  #     let(:user) {FactoryGirl.create :user}
  #     let(:valid_attributes) {{:name => 'bill', :email => 'michael@epicodus.com'}}
  #     let(:valid_parameters) {{:id => user.id, :user => valid_attributes}}

  #     before {put :update, valid_parameters, {'user_id' => user.id}}

  #     it 'updates the user' do
  #       User.find(user.id).email.should eq valid_attributes[:email]
  #     end

  #     it {should redirect_to user_path(user)}
  #     it {should set_the_flash[:notice]}
  #   end
  # end

  # context 'DELETE destroy' do
  #   it 'destroys a contact' do
  #     contact = FactoryGirl.create :user
  #     expect {delete :destroy, {:id => user.id}}.to change(User, :count).by(-1)
  #   end

  #   let(:user) {FactoryGirl.create :user}
  #   before {delete :destroy, {:id => user.id}}

  #   it {should redirect_to root_path}
  #   it {should set_the_flash[:notice]}
  # end

  # context 'GET index' do
  #   before {get :index}

  #   it {should render_template :index}
  # end
end
