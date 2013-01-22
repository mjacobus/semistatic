module Zpages
  module PagesHelper

    # ouputs the form elements for each attribute of the page
    #
    # @param Zpages::Config::Page page_config
    # @param Zpages::Page (the ActiveRecord Model)
    # @return String
    def pages_fields(page_config, page)
      html = raw ''
      page_config.attributes.each do |name, attribute|
        type = attribute.options[:type].to_s.downcase
        element = send("create_page_element_#{type}", attribute, page)
        html << wrap_element(attribute, element)
      end
      html
    end

    def create_page_element_string(attribute, page)
      value = nil
      text_field(attribute.name, value, {class: 'zpages-string'})
    end

    def create_page_element_html(attribute, page)
      value = nil
      text_area_tag(attribute.name, value, {class: 'zpages-html'})
    end

    def wrap_element(attribute, element)
      content_tag(:div,
        content_tag(:label, attribute.name.titleize) + element,
        {class: 'zpages-container'}
      )
    end
  end
end
