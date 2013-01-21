require 'spec_helper'

module ZPages
  describe Page do
    describe "#initialize" do
      let(:page) do
        Page.new({
          title: { type: :string },
          body: { type: :html },
        })
      end

      subject { page }

      its(:attributes) { should have_key(:title) }
      its(:attributes) { should have_key(:body) }

      context "when attribute is String" do
        subject { page.attributes[:title] }
        it { should be_kind_of(ZPages::Attribute::String) }
      end

      context "when attribute is String" do
        subject { page.attributes[:body] }
        it { should be_kind_of(ZPages::Attribute::Html) }
      end
    end

    describe "#attributes" do
      its(:attributes) { should == {} }
    end
  end
end