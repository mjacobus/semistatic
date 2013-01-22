require 'spec_helper'

module Zpages
  describe Attribute do
    it { should allow_mass_assignment_of(:file) }
    it { should allow_mass_assignment_of(:title) }
    it { should allow_mass_assignment_of(:value) }

    it { should validate_presence_of(:page) }
    it { should validate_presence_of(:title) }
  end
end