require 'spec_helper'

describe CouplesController do
 

  context 'routes' do 
    it {should route(:get, '/couples/new').to :action => :new}
    it {should route(:post, '/couples').to :action => :create}
    it {should route(:get, '/couples/1').to :action => :show, :id => 1}
    it {should route(:get, '/couples').to :action => :index}
    it {should route(:get, '/couples/1/edit').to :action => :edit, :id => 1}
    it {should route(:delete, '/couples/1').to :action => :destroy, :id => 1}
  end

  context 'GET new' do
    it 'renders new couple template' do
      # user = FactoryGirl.create(:user)
      # user1 = user
      get :new
      should render_template :new
    end
  end

  context 'POST create' do
    let(:date) {Date.today}
    let(:user1) {FactoryGirl.create(:user)}
    let(:user2) {FactoryGirl.create(:user)}

    it 'creates a couple' do
      usera = user1
      usera.create_profile({:name => 'jo',:gender => 'female', :birthdate => date, :city => 'denver', :state => 'CO'})
      userb = user2
      userb.create_profile({:name => 'bernie',:gender => 'female', :birthdate => date, :city => 'denver', :state => 'CO'})
      expect {post :create, {:partner_id => usera.profile.id, :profile_id => userb.profile.id, :couple => {:anniversary => date, :status => 'young'}}}.to change(Couple, :count).by(1)
    end

    it 'sets couple_id for profiles' do
      usera = user1
      usera.create_profile({:name => 'jo',:gender => 'female', :birthdate => date, :city => 'denver', :state => 'CO'})
      userb = user2
      userb.create_profile({:name => 'bernie',:gender => 'female', :birthdate => date, :city => 'denver', :state => 'CO'})

      post :create, {:partner_id => usera.profile.id, :profile_id => userb.profile.id, :couple => {:anniversary => date, :status => 'young'}}

      usera.profile.couple.should eq userb.profile.couple
    end
  end

  context 'GET edit' do

    let(:couple) {FactoryGirl.create(:couple)}
    before {get :edit, :id => couple.id}

    it {should render_template :edit}

  end

  context 'PUT update' do
    let(:date) {Date.yesterday}
    let(:couple) {FactoryGirl.create(:couple)}

    context 'with valid parameters' do
      let(:valid_attributes) {{:anniversary => date, :status => 'engaged'}}
      let(:valid_parameters) {{:id => couple.id, :couple => valid_attributes}}

      before {put :update, valid_parameters}

      it 'updates the couple' do
        Couple.find(couple.id).anniversary.should eq valid_attributes[:anniversary]
      end

      it {should redirect_to couple_path(couple)}
      it {should set_the_flash[:notice]}
    end

    context 'with invalid parameters' do
      let(:invalid_attributes) {{:anniversary => ''}}
      let(:invalid_parameters) {{:id => couple.id, :couple => invalid_attributes}}

      before {put :update, invalid_parameters}

      it {should render_template :edit}
      it {should set_the_flash[:alert]}
    end
  end

  context 'DELETE destroy' do
    let(:date) {Date.yesterday}
    it 'deletes a couple' do
      couple = FactoryGirl.create(:couple)
      expect {delete :destroy, {:id => couple.id}}.to change(Couple, :count).by(-1)
    end

    let(:couple) {FactoryGirl.create(:couple)}
    before {delete :destroy, {:id => couple.id}}

    it {should redirect_to root_path}
    it {should set_the_flash[:notice]}
  end
end