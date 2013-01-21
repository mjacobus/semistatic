module Zpages
  class Page
    attr_reader :attributes

    # @param Hash attributes
    #             # the name and options for the attributes
    #             # Page.new(
    #             #   title: { type: :string },
    #             #   body:  { type: :html }
    #             # )
    def initialize(attributes = {})
      @attributes = {}
      attributes.each do |name, options|
        @attributes[name] = factory_attribute(options)
      end
    end

    private
      def factory_attribute(options)
        "Zpages::Attribute::#{options[:type].to_s.capitalize}".constantize.new
      end
  end
end