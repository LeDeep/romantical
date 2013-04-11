require 'spec_helper'

describe Compensation do
  context 'validation' do
    it {should validate_presence_of(:profile_id)}
    it {should validate_presence_of(:assignment_id)}
    it {should validate_presence_of(:points)}
    it {should validate_presence_of(:date_of_occurrence)}
  end
  context 'mass assignment allowance' do
    it {should allow_mass_assignment_of(:profile_id)}
    it {should allow_mass_assignment_of(:assignment_id)}
    it {should allow_mass_assignment_of(:points)}
    it {should allow_mass_assignment_of(:date_of_occurrence)}
  end
  context 'association' do
    it {should belong_to(:assignment)}
    it {should belong_to(:profile)}
  end
end