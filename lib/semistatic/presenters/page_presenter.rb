module Semistatic
  module Presenters
    class PagePresenter

      attr_accessor :helpers, :page


      def initialize(page, helpers)
        @page = page
        @helpers = helpers
      end

      # ouput a part
      # @param Symbol name # the part name
      #                    # when :page_title => page.title
      #                    # else render the part as with its type renderer
      #
      # @return string
      def output(name)
        if name.to_sym == :page_title
          @page.title
        else
          part = @page.part(name)
          method = "output_#{part.type}"

          if respond_to?(method)
            send(method, part)
          else
            part.value
          end
        end
      end

      # render the part as html
      # @param Symbol name # the part name
      # @return String
      def render_html(part)
        part.value
      end

      # render the part as html
      # @param Symbol name # the part name
      # @param Symbol size # defaults to :original
      # @return String
      def output_image(part, size = :original)
        if part.file?
          helpers.image_tag(part.file.url(size))
        end
      end

      # @param ActionView::Helpers::FormBuilder form
      # @return String # => the input element for the form
      def input(form)
        part = form.object
        case part.type
          when :string
            form.text_field :value
          when :html
            form.text_area :value
          when :image
            input = form.file_field :file
            if part.file?
              input = output(part.name) + input
            end
            helpers.content_tag(:div, input)
        end
      end
    end
  end
end