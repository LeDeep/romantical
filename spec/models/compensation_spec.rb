require 'spec_helper'

describe Compensation do
  context 'validation' do
    it {should validate_presence_of(:user_id)}
    it {should validate_presence_of(:activity_id)}
    it {should validate_presence_of(:points)}
    it {should validate_presence_of(:expiration)}
  end
  context 'mass assignment allowance' do
    it {should allow_mass_assignment_of(:user_id)}
    it {should allow_mass_assignment_of(:activity_id)}
    it {should allow_mass_assignment_of(:points)}
    it {should allow_mass_assignment_of(:expiration)}
  end
  context 'association' do
    it {should belong_to(:activity)}
    it {should belong_to(:user)}
  end
end