require 'spec_helper'

describe Assignment do
  context 'validation' do
    it {should validate_presence_of(:couple_id)}
    it {should validate_presence_of(:activity)}
    it {should validate_presence_of(:points)}
  end
  context 'mass assignment allowance' do
    it {should allow_mass_assignment_of(:couple_id)}
    it {should allow_mass_assignment_of(:activity)}
    it {should allow_mass_assignment_of(:points)}
  end
  context 'association' do
    it {should belong_to(:couple)}
    it {should have_many(:compensations)}
  end
end