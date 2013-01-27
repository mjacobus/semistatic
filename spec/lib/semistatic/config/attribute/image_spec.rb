require 'spec_helper'

describe Semistatic::Config::Attribute::Image, '#type' do
  subject { Semistatic::Config::Attribute::Image.new(:name) }
  its(:type) { should eq(:image) }
end