module Zpages
  module Config
    module Attribute
      class Image < Base
        class Error < StandardError; end

        attr_reader :width, :height

        # Overrides Base initilizer
        # @see Zpages::Config::Attribute::Base
        def initialize(name, options = {})
          super

          unless @options[:height].present?
            raise Error.new('No height defined')
          end

          unless @options[:width].present?
            raise Error.new('No width defined')
          end

          @width = @options[:width].to_i
          @height = @options[:height].to_i
        end

      end # Image
    end
  end
end