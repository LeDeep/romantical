require 'spec_helper'

describe Picture do 
  context 'associations' do 
    it {should belong_to :user}
    it {should belong_to :profile}
  end
end