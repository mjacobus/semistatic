module Zpages
  module Config
    module Attribute
      class Base
        attr_reader :name, :options

        # @param String name
        # @param Hash options
        #             Available options: type
        def initialize(name, options)
          @name = name
          @options = HashWithIndifferentAccess.new(options)
        end

        def type
          @type ||= self.class.to_s.split('::').last.downcase
        end
      end
    end
  end
end