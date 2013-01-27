module Semistatic
  module Config
    module Attribute
      class Base
        attr_reader :name, :options

        # @param String name
        # @param Hash options
        #             Available options: type
        def initialize(name, options = {})
          @name = name.to_s
          @options = HashWithIndifferentAccess.new(options)
        end

        # get the type of th eelement, which is the lowercase class name
        # I.E. :base
        # @return String
        def type
          @type ||= self.class.to_s.split('::').last.downcase.to_sym
        end

        # Get the label of the element
        # @return String
        def label
          if @options[:label].present?
            @options[:label]
          else
            name.capitalize
          end
        end

        # get the description
        # @return String # the description
        def description
          @options[:description]
        end
      end
    end
  end
end