module Zpages
  module PageViewHelper
    def page_part(part)
      unless @page_config
        Zpages.configuration.load
        @page_config = Zpages.configuration.page(@page.template_name)
      end

      attribute = @page_config.attributes[part]
      page_part_by_name(part).value
    end

    def page_part_by_name(name)
      @page.parts.select {|p| p.name == name.to_s }.first
    end
  end
end
