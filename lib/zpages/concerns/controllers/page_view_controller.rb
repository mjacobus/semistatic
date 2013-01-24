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
          @page = Page.find_by_slug(params[:slug])

          unless @page
            raise ActiveRecord::RecordNotFound.new("Page not found")
          end

          render file: "layouts/templates/#{@page.template_name}"
        end

        # get the proper content for a given part
        # Usage:
        #     <%= semistatic_content(:page_title) %> # for the @page.title
        #     <%= semistatic_content(:part_name) %> # body
        #
        # @param Symbol the part name # :page_title for title and
        #                             # :any_part_name for the part name
        # @return String
        def semistatic_content(part_name)
          if part_name.to_sym == :page_title
            @page.title
          else
            helpers = self.class.helpers
            part = @page.part(part_name)

            case part.type
              when :html
               helpers.raw part.value
              when :image
                helpers.image_tag(part.file.url)
              else
                part.value
            end
          end
        end

      end # PageViewController
    end
  end
end