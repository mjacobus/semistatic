require_dependency "zpages/application_controller"

module Zpages
  class PagesController < ApplicationController
    respond_to :html

    # GET /pages
    # GET /pages.json
    def index
      @pages = Page.all
      respond_with(@pages)
    end

    # GET /pages/1
    # GET /pages/1.json
    def show
      @page = Page.find(params[:id])
      respond_with(@page)
    end

    # GET /pages/new
    # GET /pages/new.json
    def new
      @page = Page.new
      respond_with(@page)
    end

    # GET /pages/1/edit
    def edit
      @page = Page.find(params[:id])
    end

    # POST /pages
    # POST /pages.json
    def create
      @page = Page.new(params[:page])
      @page.save
      respond_with(@page)
    end

    # PUT /pages/1
    # PUT /pages/1.json
    def update
      @page = Page.find(params[:id])
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
  end
end
