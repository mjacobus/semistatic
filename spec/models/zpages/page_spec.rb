require 'spec_helper'

describe Zpages::Page do
  it { should_not allow_mass_assignment_of(:options) }
  it { should allow_mass_assignment_of(:slug) }
  it { should allow_mass_assignment_of(:template_name) }
  it { should allow_mass_assignment_of(:title) }
  it { should validate_presence_of(:slug) }
  it { should validate_uniqueness_of(:slug).case_insensitive }
  it { should validate_presence_of(:title) }
  it { should have_many(:parts) }
  it { should accept_nested_attributes_for(:parts) }
end


describe Zpages::Page, '.factory' do
  let(:page_config) do
    Zpages::Config::Page.new(:page_name, {
      attributes: {
        title: { type: :string},
        body:  { type: :html},
      }
    })
  end

  subject { described_class.factory(page_config) }
  its(:template_name) { should eq('page_name') }
  its('parts.count') { should eq(2) }

  it "has a part named title" do
    subject.parts.map(&:name).should include('title')
  end

  it "has a part named body" do
    subject.parts.map(&:name).should include('body')
  end

  it "has parts with the attribute options saved on it" do
    subject.parts.find_by_name(:title).options.should eq(
      HashWithIndifferentAccess.new({ type: :string})
    )
  end
end #.factory


describe Zpages::Page, "#part" do
  it "gets part by name" do
    page = Zpages::Page.factory(Zpages::Config::Page.new(:page_name, {
      attributes: {
        title: { type: :string},
        body:  { type: :html},
      }
    }))

    page.part('title').should be_a Zpages::Part
    page.part('title').name.should == 'title'
    page.part(:body).should be_a Zpages::Part
    page.part(:body).name.should == 'body'
  end
end

