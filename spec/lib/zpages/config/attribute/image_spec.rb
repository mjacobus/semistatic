require 'spec_helper'

describe Zpages::Config::Attribute::Image, '#type' do
  subject { Zpages::Config::Attribute::Image.new(:name) }
  its(:type) { should eq(:image) }
end