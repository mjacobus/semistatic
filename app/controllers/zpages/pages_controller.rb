require_dependency "zpages/application_controller"

module Zpages
  class PagesController < ApplicationController
    respond_to :html

    before_filter :set_pages_config

    # GET /pages
    # GET /pages.json
    def index
      @pages = Page.all
      respond_with(@pages)
    end

    # GET /pages/1
    # GET /pages/1.json
    def show
      @page = find_or_create_page
      respond_with(@page)
    end

    # GET /pages/new
    # GET /pages/new.json
    def new
      @page = find_or_create_page
      respond_with(@page)
    end

    # GET /pages/1/edit
    def edit
      @page = find_or_create_page
    end

    # POST /pages
    # POST /pages.json
    def create
      @page = find_or_create_page
      @page.update_attributes(params[:page])
      @page.save
      respond_with(@page)
    end

    # PUT /pages/1
    # PUT /pages/1.json
    def update
      @page = find_or_create_page
      @page.update_attributes(params[:page])
      respond_with(@page)
    end

    # DELETE /pages/1
    # DELETE /pages/1.json
    def destroy
      @page = Page.find(params[:id])
      @page.destroy
      respond_with(@page)
    end

    private
      def set_pages_config
        @config = Zpages.configuration
        @config.load
      end

      def find_or_create_page
        if params[:id]
          Page.find(params[:id])
        else
          Page.create(template_name: params[:template_name])
        end
      end
  end
end
