module Semistatic
  module Config
    class Page
      attr_reader :attributes, :name


      # @param Hash options
      #             # the name and options for the attributes
      #             # Page.new(:page_name,
      #             #   title: { type: :string },
      #             #   body:  { type: :html }
      #             # )
      def initialize(name, options = {})
        @attributes = HashWithIndifferentAccess.new
        @name = name.to_s
        options = HashWithIndifferentAccess.new(options)
        if options[:attributes]
            options[:attributes].each do |name, options|
            @attributes[name] = self.class.factory_attribute(name, options)
          end
        end
      end


      def self.factory_attribute(name, options)
        "Semistatic::Config::Attribute::#{options[:type].to_s.capitalize}".constantize.new(name, options)
      end
    end
  end
end