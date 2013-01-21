require 'spec_helper'

module Zpages
  describe Configuration do

    it "should be configured as as block" do
      Zpages.configure do |config|
        config.templates_path = '/'
      end

      Zpages.configuration.templates_path.should == '/'
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

    describe "#load" do
      before do
        subject.config_files = ["#{Rails.root}/../zpages_test.yml"]
        subject.load
      end

      it "should load config from yaml file" do
        pages = subject.pages
        pages.should eq({
          body_and_title: {
            attributes: {
              title: {type: 'string'},
              body: { type: 'text' }
            },
          },
          text_and_html: {
            attributes: {
              text: { type: 'text' },
              html: { type: 'html' }
            }
          }
        })
        subject.page(:body_and_title).should == pages[:body_and_title]
      end
    end

  end
end