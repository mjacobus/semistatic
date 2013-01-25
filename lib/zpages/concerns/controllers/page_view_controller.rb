module Zpages
  module Concerns
    module Controllers
      module PageViewController
        extend ActiveSupport::Concern

        included do
          helper_method :semistatic_content
        end

        # get the page by slug
        # show action
        # render "layouts/templates/#{@page.template_name}"
        # @raises ActiveRecord::RecordNotFound when page is not found
        def show
          page = Page.find_by_slug(params[:slug])

          unless page
            raise ActiveRecord::RecordNotFound.new("Page not found")
          end

          @presenter = Presenters::PagePresenter.new(page, self.class.helpers)

          render file: "layouts/templates/#{page.template_name}"
        end

      end # PageViewController
    end
  end
end