require 'spec_helper'

module Zpages
  describe Part do
    it { should allow_mass_assignment_of(:file) }
    it { should allow_mass_assignment_of(:value) }
    it { should allow_mass_assignment_of(:name) }

    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name).case_insensitive.scoped_to(:page_id) }
    it { should validate_presence_of(:page) }

  end
end