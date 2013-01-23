module Zpages
  module Concerns
    module Controllers
      module PageViewController
        extend ActiveSupport::Concern

        # show action
        def show
          @page = Page.find_by_slug(params[:slug])

          unless @page
            raise ActiveRecord::RecordNotFound.new("Page not found")
          end

          render file: 'layouts/templates/' + @page.template_name
        end

      end # PageViewController
    end
  end
end