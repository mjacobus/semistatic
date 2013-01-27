module Semistatic
  module PagesHelper
    def page_attribute_form_element(subform)
      part = subform.object

      case part.type
        when :string
          subform.text_field :value
        when :html
          subform.text_area :value
        when :image
          input = subform.file_field :file
          if part.file?
            input = image_tag(part.file.url) + input
          end
          content_tag(:div, input)
      end
    end
  end
end
