require 'spec_helper'

describe Zpages::Config::Attribute::Image, '#type' do
  subject { Zpages::Config::Attribute::Image.new(:name, { width: 300, height: 400 }) }
  its(:type) { should eq(:image) }
end

describe Zpages::Config::Attribute::Image, '#width' do
  subject { Zpages::Config::Attribute::Image.new(:name, { width: 300, height: 400 }) }
  its(:width) { should eq(300) }
end

describe Zpages::Config::Attribute::Image, '#height' do
  subject { Zpages::Config::Attribute::Image.new(:name, { width: 300, height: 400 }) }
  its(:height) { should eq(400) }
end

describe Zpages::Config::Attribute::Image, '#initialize' do
  it "raises when there is no width" do
    expect {
      Zpages::Config::Attribute::Image.new(:name, { height: 300 })
    }.to raise_error(Zpages::Config::Attribute::Image::Error, 'No width defined')
  end

  it "raises when there is no height" do
    expect {
      Zpages::Config::Attribute::Image.new(:name, { width: 300 })
    }.to raise_error(Zpages::Config::Attribute::Image::Error, 'No height defined')
  end
end
