require 'spec_helper'

describe Profile do 

  context 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :gender}
    it {should validate_presence_of :birthdate}
    it {should validate_presence_of :city}
    it {should validate_presence_of :state}
    it {should validate_presence_of :user_id}

  end

  context 'accessibility' do 
    it {should allow_mass_assignment_of :name}
    it {should allow_mass_assignment_of :gender}
    it {should allow_mass_assignment_of :birthdate}
    it {should allow_mass_assignment_of :city}
    it {should allow_mass_assignment_of :state}
    it {should allow_mass_assignment_of :user_id}

  end

  context 'asscociations' do
    it {should belong_to :user}
  end

  context 'points' do
    it 'returns a users points' 
    
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
    it 'returns user age'
  end
end