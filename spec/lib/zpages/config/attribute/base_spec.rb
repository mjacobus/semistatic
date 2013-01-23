require 'spec_helper'

describe Zpages::Config::Attribute::Base, '#type' do
  subject { described_class.new(:name) }
  its(:type) { should eq(:base) }
end

describe Zpages::Config::Attribute::Base, '#name' do
  subject { described_class.new(:name) }
  its(:name) { should eq('name') }
end

describe Zpages::Config::Attribute::Base, '#description' do
  subject { described_class.new(:name, { description: 'a description'}) }
  its(:description) { should eq('a description') }
end

describe Zpages::Config::Attribute::Base, '#label' do
  context "when given" do
    subject { described_class.new(:name, { label: 'The Label'}) }
    its(:label) { should eq('The Label') }
  end

  context "when not given" do
    subject { described_class.new(:name) }
    its(:label) { should eq('Name') }
  end

  context "when not blank" do
    subject { described_class.new(:name, { label: '' }) }
    its(:label) { should eq('Name') }
  end
end