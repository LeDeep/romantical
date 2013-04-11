require 'spec_helper'

describe Message do 
  context 'validations' do 
    it {should validate_presence_of :to}
    it {should validate_presence_of :from}
    it {should validate_presence_of :body}
  end

  context 'accessbility' do 
    it {should allow_mass_assignment_of :to}
    it {should allow_mass_assignment_of :from}
    it {should allow_mass_assignment_of :body}
  end
end