require 'spec_helper'

describe PicturesController do

 let(:date) {Date.today}
 let(:picture) {Picture.create({:picture_file_name => 'jim', :picture_file_size => 311, :picture_content_type => 'image/jpg', :picture_updated_at => date, :user_id => 1})}
 let(:user) {User.create({:email => 'whatever@email.com', :password => 'reallgreat231212', :password_confirmation => 'reallgreat231212'})}

  context 'routes' do
    it {should route(:get, '/pictures/new').to :action => :new}
    it {should route(:post, '/pictures').to :action => :create}
    it {should route(:get, '/pictures/1').to :action => :show, :id => 1}
    it {should route(:get, '/pictures').to :action => :index}
    it {should route(:get, '/pictures/1/edit').to :action => :edit, :id => 1}
    it {should route(:delete, '/pictures/1').to :action => :destroy, :id => 1}
  end

  context 'GET new' do 
    before {get :new}
    it {should render_template :new}
  end

  context 'POST create' do 

    context 'with valid parameters' do 

      let(:user) {FactoryGirl.create(:user)}
      let(:picture) {FactoryGirl.create(:picture)}
      let(:valid_attributes) {{:picture_file_name => 'jim', :picture_file_size => 311, :picture_content_type => 'image/jpg', :picture_updated_at => date, :user_id => 1}}

      it 'creates a new picture' do
        expect {post :create, valid_attributes}.to change(Picture, :count).by(1)
      end

      before {post :create, valid_attributes}

      it {should redirect_to pictures_path}
      # it {should redirect_to picture_path(@picture)}
      it {should set_the_flash[:notice]}
    end
  end

  context 'GET index' do 
    before {get :index}

    it {should render_template :index}
  end

  context 'GET show' do 
    
     let(:valid_attributes) {{:picture_file_name => 'jim', :picture_file_size => 311, :picture_content_type => 'image/jpg', :picture_updated_at => date, :user_id => 1}}
     let(:valid_parameters) {{:picture => valid_attributes}}

     before {get :show, {:id => picture.id}}

     it {should render_template :show}
  end

  context 'GET edit' do
    let(:picture) {FactoryGirl.create(:picture)}
    before {get :edit, :id => picture.id}

    it {should render_template :edit}
  end

  context 'PUT update' do
    let(:picture) {FactoryGirl.create(:picture)}

    context 'with valid parameters' do
      let(:valid_attributes) {{:picture_file_name => 'picture', :picture_file_size => 311, :picture_content_type => 'image/jpg', :picture_updated_at => date, :user_id => 1}}
      let(:valid_parameters) {{:id => picture.id, :picture => valid_attributes}}

      before {put :update, valid_parameters}

      it 'updates the picture' do
        Picture.find(picture.id).picture_file_name.should eq valid_attributes[:picture_file_name]
      end

 #     it {should redirect_to picture_path(picture)}
      it {should set_the_flash[:notice]}
    end

    context 'with invalid parameters' do
      let(:invalid_attributes) {{:picture_content_type => 12}}
      let(:invalid_parameters) {{:id => picture.id, :picture => invalid_attributes}}

      before {put :update, invalid_parameters}

      it {should render_template :edit}
      it {should set_the_flash[:alert]}
    end
  end

  context 'DELETE destroy' do
    it 'deletes a picture' do
      picture = FactoryGirl.create(:picture)
      expect {delete :destroy, {:id => picture.id}}.to change(Picture, :count).by(-1)
    end

    let(:picture) {FactoryGirl.create(:picture)}
    before {delete :destroy, {:id => picture.id}}

    it {should redirect_to picture_path}
    it {should set_the_flash[:notice]}
  end
end