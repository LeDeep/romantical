require 'spec_helper'

describe MessagesController do
  context 'routing' do
    it {should route(:get, '/messages/new').to :action => :new}
    it {should route(:post, '/messages').to :action => :create}
    it {should route(:get, '/messages').to :action => :index}
  end

  context 'GET new' do 
    before {get :new}
    it {should render_template :new}
  end

  context 'POST create' do 

    context 'with valid parameters' do 

     let(:user) {FactoryGirl.create(:user)}
     let(:valid_attributes) {{:user_id => user.id, :message => {:from => 'jane', :to => 'bob', :body => "this is the text"}}}

      it 'creates a new message' do
        expect {post :create, valid_attributes}.to change(Message, :count).by(1)
      end

      before {post :create, valid_attributes}

      it {should redirect_to messages_path}
      it {should set_the_flash[:notice]}
    end

  end

  context 'GET index' do 
    before {get :index}

    it {should render_template :index}
  end
end