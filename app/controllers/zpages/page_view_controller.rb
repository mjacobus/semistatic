require_dependency "zpages/application_controller"

module Zpages
  class PageViewController < ApplicationController
    def show
      @page = Page.find_by_slug(params[:slug])

      unless @page
        raise ActiveRecord::RecordNotFound.new("Page not found")
      end

      render file: 'layouts/templates/' + @page.template_name
    end
  end
end
