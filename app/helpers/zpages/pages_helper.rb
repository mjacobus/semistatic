module Zpages
  module PagesHelper
    def page_attribute_form_element(subform, page, config)
      page = config.page(page.template_name)

      case page.attributes[subform.object.name].type
        when :string
          subform.text_field :value
        when :html
          subform.text_area :value
      end
    end
  end
end
