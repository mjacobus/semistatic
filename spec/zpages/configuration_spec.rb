require 'spec_helper'

module ZPages
  describe Configuration do

    it "should be configured as as block" do
      ZPages.configure do |config|
        config.templates_path = '/'
      end

      ZPages.configuration.templates_path.should == '/'
    end

    describe "#templates_path" do
      it 'should default to rails layouts folder' do
        subject.templates_path.should == Pathname.new("#{Rails.root}/app/views/layout")
      end
    end

    describe "#config_files" do
      its(:config_files) { should == [Pathname.new("#{Rails.root}/config/zpages.yml")] }

      it "should be settable" do
        files = ['file1.yml', 'file2.yml']
        subject.config_files = files
        subject.config_files.should == files
      end
    end

  end
end