require 'spec_helper'

describe Activity do
  context 'validation' do
    it {should validate_presence_of(:name)}
  end
  context 'mass assignment allowance' do
    it {should allow_mass_assignment_of(:name)}
  end
  context 'association' do
    it {should have_many(:assignments)}
  end
end