require 'spec_helper'

describe Zpages::Part do
  it { should allow_mass_assignment_of(:file) }
  it { should allow_mass_assignment_of(:value) }
  it { should allow_mass_assignment_of(:name) }

  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name).case_insensitive.scoped_to(:page_id) }
  it { should validate_presence_of(:page) }
end


describe Zpages::Part, "#options" do
  let(:hash) { HashWithIndifferentAccess.new(:option_1 => 'value 1', 'option_2' => 'value 2') }
  let(:part_id) { FactoryGirl.create(:zpages_part, options: hash).id }

  it "is a serialized param" do
    # force reload
    part = Zpages::Part.where('id > 0').where(id: part_id).first
    part.options.should be_a HashWithIndifferentAccess
    part.options.should have_key('option_1')
    part.options.should have_key(:option_2)
    part.options[:option_1].should eq('value 1')
    part.options[:option_2].should eq('value 2')
  end
end