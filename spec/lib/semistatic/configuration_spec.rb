require 'spec_helper'

module Semistatic
  describe Configuration do

    it "should be configured as as block" do
      Semistatic.configure do |config|
        config.templates_path = '/'
      end

      Semistatic.configuration.templates_path.should == '/'
    end

    describe "#templates_path" do
      it 'should default to rails layouts folder' do
        subject.templates_path.should == Pathname.new("#{Rails.root}/app/views/layout")
      end
    end

    describe "#config_files" do
      its(:config_files) { should == [Pathname.new("#{Rails.root}/config/semistatic.yml")] }

      it "should be settable" do
        files = ['file1.yml', 'file2.yml']
        subject.config_files = files
        subject.config_files.should == files
      end
    end

    describe "#load" do
      before do
        subject.config_files = ["#{Rails.root}/../semistatic_test.yml"]
        subject.load
      end

      it "should load config from yaml file" do
        subject.pages.each do |name, page|
          page.should  be_a Semistatic::Config::Page
          page.name.should == name
        end
      end
    end

    describe "#page" do
      before do
        subject.config_files = ["#{Rails.root}/../semistatic_test.yml"]
        subject.load
      end

      it "should get page with Symbol key" do
        subject.page(:body_and_title).should  be_a Semistatic::Config::Page
      end

      it "should get page with String key" do
        subject.page('body_and_title').should be_a Semistatic::Config::Page
      end

      it "should raise error when page does not exist" do
        expect { subject.page(:no_exists) }.to raise_error(Semistatic::Configuration::Error)
      end

      context "page attributes" do
        it "should factory attributes" do
          page = subject.page(:body_and_title)
          page.attributes.first[1].should be_a Semistatic::Config::Attribute::String
        end
      end
    end

    describe "#pages" do
      before do
        subject.config_files = ["#{Rails.root}/../semistatic_test.yml"]
        subject.load
      end

      it "should factory pages from file" do
        subject.pages.each do |name, page|
           page.should be_a Semistatic::Config::Page
           page.name.should == name
        end
      end
    end

    describe ".factory_page" do
      subject { described_class }
      it "should factory page" do
        page = subject.factory_page(:page_name, { attributes: { body: {type: :string } } } )
        page.should be_a Semistatic::Config::Page
        page.name.to_s.should == 'page_name'
      end
    end

  end
end