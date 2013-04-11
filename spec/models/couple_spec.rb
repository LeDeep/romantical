require 'spec_helper'

describe Couple do
  context 'validation' do
    it {should validate_presence_of(:anniversary)}
    it {should validate_presence_of(:status)}
  end
  context 'mass assignment allowance' do
    it {should allow_mass_assignment_of(:anniversary)}
    it {should allow_mass_assignment_of(:status)}
  end
  context 'association' do
    it {should have_many(:profiles)}
    it {should have_many(:assignments)}
  end
end