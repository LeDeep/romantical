require 'spec_helper'

describe Profile do 

  context 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :gender}
    it {should validate_presence_of :in_relationship_with}
    it {should validate_presence_of :relationship_status}
    it {should validate_presence_of :anniversary}
    it {should validate_presence_of :age}
    it {should validate_presence_of :city}
    it {should validate_presence_of :state}
    it {should validate_presence_of :user_id}

  end

  context 'accessibility' do 
    it {should allow_mass_assignment_of :name}
    it {should allow_mass_assignment_of :points}
    it {should allow_mass_assignment_of :gender}
    it {should allow_mass_assignment_of :in_relationship_with}
    it {should allow_mass_assignment_of :relationship_status}
    it {should allow_mass_assignment_of :anniversary}
    it {should allow_mass_assignment_of :age}
    it {should allow_mass_assignment_of :city}
    it {should allow_mass_assignment_of :state}
    it {should allow_mass_assignment_of :user_id}

  end

  context 'asscociations' do
    it {should belong_to :user}
  end
end