require 'spec_helper'

module Zpages
  describe Part do
    it { should allow_mass_assignment_of(:file) }
    it { should allow_mass_assignment_of(:name) }
    it { should allow_mass_assignment_of(:value) }

    it { should validate_presence_of(:page) }
    it { should validate_presence_of(:name) }
  end
end