require 'spec_helper'

module Zpages
  module Config
    describe Page do
      let(:attributes) { { attributes: { title: { type: :string }, body: { type: :html } } } }
      let(:page) { Page.new(:page_name, attributes) }
      subject { page }

      its(:attributes) { should have_key(:title) }
      its(:attributes) { should have_key(:body) }

      context "when attribute is String" do
        subject { page.attributes[:title] }
        it { should be_kind_of(Zpages::Config::Attribute::String) }
      end

      context "when attribute is String" do
        subject { page.attributes[:body] }
        it { should be_kind_of(Zpages::Config::Attribute::Html) }
      end

      describe "#attributes" do
        its(:attributes) { should be_a HashWithIndifferentAccess }
      end
    end
  end
end
