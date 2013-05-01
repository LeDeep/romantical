require 'spec_helper'

describe Profile do 



  context 'accessibility' do 
    it {should allow_mass_assignment_of :first_name}
    it {should allow_mass_assignment_of :last_name}
    it {should allow_mass_assignment_of :gender}
    it {should allow_mass_assignment_of :birthdate}
    it {should allow_mass_assignment_of :city}
    it {should allow_mass_assignment_of :state}
    it {should allow_mass_assignment_of :user_id}

  end

  context 'asscociations' do
    it {should belong_to :user}
    it {should belong_to(:couple)}
    it {should have_many(:compensations)}
    # it {should belong_to(:partner).class_name('User')}
  end

  context 'points' do
    it 'returns a profiles partner'
  end

  context 'points' do
    it 'returns a profiles points' 
    
  end

  context 'in_relationship_with' do
    it 'returns partner name'
  end

  context 'relationship_status' do
    it 'returns couple status'
  end

  context 'anniversary' do
    it 'returns couple anniversary'
  end

  context 'age' do
    it 'returns profiles age'
  end
end