require 'spec_helper'

describe Semistatic::Presenters::PagePresenter do
  let(:helpers) { ApplicationController.helpers }
  let(:string_part)  { FactoryGirl.build_stubbed(:part, options: { type: :string }, name: :string) }
  let(:html_part)    { FactoryGirl.build_stubbed(:part, options: { type: :html   }, name: :html) }
  let(:image_part)   { FactoryGirl.build_stubbed(:part, options: { type: :image  }, name: :image) }

  let(:page) do
    page = FactoryGirl.build_stubbed(:page, title: 'page title', parts: [string_part, html_part, image_part])
    page.stub(:part).with(:string_part).and_return(string_part)
    page.stub(:part).with(:html_part).and_return(html_part)
    page.stub(:part).with(:image_part).and_return(image_part)
    page
  end


  subject { described_class.new(page, helpers) }

  its(:page) { should == page }
  its(:helpers) { should == helpers }


  describe "#output" do

    context "with :page_title" do
      it "gets the @page.title" do
        subject.output(:page_title).should eq('page title')
      end
    end

    context "with string part" do
      before { string_part.stub(:value).and_return('<p>scaped string</p>') }

      it "renders a string" do
        subject.output(:string_part).should eq(helpers.raw('<p>scaped string</p>'))
      end
    end

    context "with html part" do
      before { html_part.stub(:value).and_return('<p>unescaped string</p>') }

      it "renders a html" do
        subject.output(:html_part).should eq('<p>unescaped string</p>')
      end
    end

    context "with image part" do
      before { image_part.stub(:file).and_return(file) }

      context "with file" do
        let(:file) { stub('file', file?: true, url: 'image.png') }

        it "renders the image tag" do
          subject.output(:image_part).to_s.should match(Regexp.new('src="image.png"'))
          subject.output(:image_part).to_s.should match(Regexp.new('<img'))
        end
      end

      context "without file" do
        let(:file) { stub('file', file?: false, url: 'image.png') }

        it "does not render the image tag" do
          subject.output(:image_part).to_s.should_not match(Regexp.new('image.png'))
        end
      end
    end
  end


  describe "#input" do

  end
end


