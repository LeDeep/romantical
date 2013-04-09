require 'spec_helper'

describe SessionsController do

  context 'POST create' do 
    context 'session authorizations' do 
      before do
        request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook]
      end
      
      it "sets a session variable to the OmniAuth auth hash" do
        request.env["omniauth.auth"][:uid].should == '1234'
      end
    end

    context 'with invalid parameters' do
      before do 
        request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook]
      end
      
      it 'should fail to find the user' do 
        request.env["omniauth.auth"][:email].should_not == ''
      end
     
      it {should redirect_to root_url}
      it {should set_the_flash[:alert]}
    end
  end
end