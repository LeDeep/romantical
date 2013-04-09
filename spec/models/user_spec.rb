require 'spec_helper'

describe User do
  context 'validations' do
    it {should validate_presence_of :username}
  end

  context 'accessible' do 
    it {should allow_mass_assignment_of :username}
    it {should allow_mass_assignment_of :email}
    it {should allow_mass_assignment_of :password}
    it {should allow_mass_assignment_of :password_confirmation}
    it {should allow_mass_assignment_of :remember_me}

  end

  context 'associations' do 
    it {should have_one :profile}
    it {should have_one :picture}

  end

end