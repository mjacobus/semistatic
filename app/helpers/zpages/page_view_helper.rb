module Zpages
  module PageViewHelper

    # render the part according to its attribute configuration
    # @attribute :symbol # the part name
    # @return String
    def page_part(part)
      unless @page_config
        Zpages.configuration.load
        @page_config = Zpages.configuration.page(@page.template_name)
      end

      attribute = @page_config.attributes[part]
      part = page_part_by_name(part)

      case attribute.type

      when :html
        raw part.value
      else
        part.value
      end
    end

    # get the page part by its name attribute
    def page_part_by_name(name)
      @page.parts.select {|p| p.name == name.to_s }.first
    end
  end
end
