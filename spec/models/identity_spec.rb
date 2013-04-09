require 'spec_helper'

describe Identity do
  context 'validations' do 
    it {should validate_presence_of :name}
    it {should allow_value('deep@romantical.com').for :email}
    it {should_not allow_value('chocolate').for :email}
    it {should_not allow_value(6546546464).for :email}
    it {should validate_uniqueness_of :email}

  end



  context 'accessibility' do
    it {should allow_mass_assignment_of :name}
    it {should allow_mass_assignment_of :email}
    it {should allow_mass_assignment_of :password}
    it {should allow_mass_assignment_of :password_confirmation}
  end
end
