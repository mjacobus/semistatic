require 'spec_helper'

module ZPages
  describe Configuration do

    it "should be configured as as block" do
      ZPages.configure do |config|
        config.templates_path = '/'
      end

      ZPages.configuration.templates_path.should == '/'
    end

    describe "#template_path" do
      it 'should default to rails layouts folder' do
        subject.templates_path.should == Pathname.new("#{Rails.root}/app/views/layout")
      end
    end

  end
end