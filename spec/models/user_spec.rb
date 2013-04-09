require 'spec_helper'

describe User do


  context 'associations' do 
    it {should have_one :profile}
    it {should have_one :picture}

  end

end