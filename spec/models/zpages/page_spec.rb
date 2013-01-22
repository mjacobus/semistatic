require 'spec_helper'

module Zpages
  describe Page do
    it { should allow_mass_assignment_of(:slug) }
    it { should allow_mass_assignment_of(:template_name) }
    it { should allow_mass_assignment_of(:title) }

    it { should validate_presence_of(:slug) }
    it { should validate_uniqueness_of(:slug).case_insensitive }
    it { should validate_presence_of(:title) }

    it { should have_many(:attributes) }
    it { should accept_nested_attributes_for(:attributes) }
  end
end
