require 'spec_helper'

module Semistatic
  describe PageViewController, "GET 'show'" do
    let(:page) {
      Page.create!(slug: 'the-slug', title: 'A Title', template_name: 'custom_template', layout: nil)
    }

    before { @routes = Rails.application.routes }

    context "with no layout" do
      it "renders the correct template with no layout and assigns the correct page to it" do
        get 'show', slug: page.slug
        response.should be_success
        assigns(:presenter).should be_a(Semistatic::Presenters::PagePresenter)
        assigns(:presenter).page.should eq(page)
        response.should render_template('custom_template')
        response.should_not render_template('layouts/semistatic/application')
      end
    end

    context "with layout" do
      before { page.update_attributes(layout: 'custom_layout') }

      it "renders the correct template with wrapped by the custom layout and assigns the correct page to it" do
        get 'show', slug: page.slug
        response.should be_success
        assigns(:presenter).should be_a(Semistatic::Presenters::PagePresenter)
        assigns(:presenter).page.should eq(page)
        response.should render_template('custom_template')
        response.should render_template('custom_layout')
      end
    end

    it "raises error when page does not exist" do
      expect { get :show,  slug: 'none' }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
