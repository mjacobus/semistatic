require 'spec_helper'

module Zpages
  describe PageViewController, "GET 'show'" do
    let(:page) {
      Page.create!(slug: 'the-slug', title: 'A Title', template_name: 'custom-template')
    }

    before { @routes = Rails.application.routes }

    it "renders the correct template and assigns the correct page to it" do
      get 'show', slug: page.slug
      response.should be_success
      assigns(:page).should eq(page)
      response.should render_template('custom-template')
    end

    it "raises error when page does not exist" do
      expect { get :show,  slug: 'none' }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
