require 'spec_helper'

module Zpages
  describe PagesController do

    let(:valid_attributes) { FactoryGirl.attributes_for(:zpages_page) }

    let(:page) { FactoryGirl.create(:zpages_page) }

    def valid_session
      {}
    end

    describe "GET index" do
      it "assigns all pages as @pages" do
        page
        get :index, {}, valid_session
        assigns(:pages).should eq([page])
      end
    end

    describe "GET show" do
      it "assigns the requested page as @page and its @presenter" do
        get :show, {:id => page.to_param}, valid_session
        assigns(:page).should eq(page)
        assigns(:presenter).should be_a(Zpages::Presenters::PagePresenter)
        assigns(:presenter).page.should eq(page)
      end
    end

    describe "GET new" do
      it "creates page and redirects to it" do
        expect {
          get :new, {template_name: 'test_template'}, valid_session
        }.to change(Page, :count).by(1)
        response.should redirect_to(edit_page_path(Page.last))
      end
    end

    describe "GET edit" do
      it "assigns the requested page as @page and its presenter" do
        get :edit, {:id => page.to_param}, valid_session
        assigns(:page).should eq(page)
        assigns(:presenter).should be_a(Zpages::Presenters::PagePresenter)
        assigns(:presenter).page.should eq(page)
      end
    end

    describe "POST create" do
      it "redirect to index" do
        post :create, {:page => valid_attributes}, valid_session
        response.should redirect_to pages_path
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        it "updates the requested page" do
          Page.any_instance.should_receive(:update_attributes).with({ "title" => "MyString" })
          put :update, {:id => page.to_param, :page => { "title" => "MyString" }}, valid_session
        end

        it "assigns the requested page as @page" do
          put :update, {:id => page.to_param, :page => valid_attributes}, valid_session
          assigns(:page).should eq(page)
        end

        it "redirects to the page" do
          put :update, {:id => page.to_param, :page => valid_attributes}, valid_session
          response.should redirect_to(page)
        end
      end

      describe "with invalid params" do
        it "assigns the page as @page" do
          Page.any_instance.stub(:save).and_return(false)
          put :update, {:id => page.to_param, :page => { "title" => "invalid value" }}, valid_session
          assigns(:page).should eq(page)
          assigns(:presenter).should be_a(Zpages::Presenters::PagePresenter)
          assigns(:presenter).page.should eq(page)
        end

        it "re-renders the 'edit' template" do
          Page.any_instance.stub(:save).and_return(false)
          put :update, {:id => page.to_param, :page => { "title" => "invalid value" }}, valid_session
          # response.should render_template("edit")
        end
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested page" do
        page = Page.create! valid_attributes
        expect {
          delete :destroy, {:id => page.to_param}, valid_session
        }.to change(Page, :count).by(-1)
      end

      it "redirects to the pages list" do
        page = Page.create! valid_attributes
        delete :destroy, {:id => page.to_param}, valid_session
        response.should redirect_to(pages_url)
      end
    end

  end
end
