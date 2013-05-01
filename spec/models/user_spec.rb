require 'spec_helper'

describe User do

  context 'accessible' do 
    it {should allow_mass_assignment_of :username}
    it {should allow_mass_assignment_of :email}
    it {should allow_mass_assignment_of :password}
    it {should allow_mass_assignment_of :password_confirmation}
    it {should allow_mass_assignment_of :remember_me}
    it {should allow_mass_assignment_of :couple_id}
  end

  context 'associations' do 
    it {should have_one(:profile)}
  end

end