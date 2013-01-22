module Zpages
  module PagesHelper
    def page_attribute_form_element(subform, page, config)
      page = config.page(page.template_name)

      case page.attributes[subform.object.name].options[:type].to_s.downcase
        when 'string'
          subform.text_field :value
        when 'html'
          subform.text_area :value
      end
    end
  end
end
