require 'spec_helper'

describe Zpages::Config::Attribute::Html, '#type' do
  subject { described_class.new(:name) }
  its(:type) { should eq(:html) }
end