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

    describe '.factory' do
      let(:page_config) do
        Config::Page.new(:page_name, {
          attributes: {
            title: { type: :string},
            body:  { type: :html},
          }
        })
      end

      subject { described_class.factory(page_config) }

      its(:template_name) { should eq('page_name') }
      its('attributes.count') { should eq(2) }

      it "should have a attribute named title" do
        subject.attributes.map(&:title).should include('title')
      end

      it "should have a attribute named body" do
        subject.attributes.map(&:title).should include('body')
      end

    end
  end
end
