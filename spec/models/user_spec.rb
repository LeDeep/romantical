require 'spec_helper'

describe User do
  context 'validations' do
    it {should validate_presence_of :username}
    it {should validate_uniqueness_of :username}
  end

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
    it {should have_one(:picture)}
    it {should have_many(:compensations)}
    it {should belong_to(:couple)}
    it {should belong_to(:partner).class_name('User')}
  end

end