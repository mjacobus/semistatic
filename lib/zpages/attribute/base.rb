module Zpages
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
    end
  end
end