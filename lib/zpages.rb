require "zpages/engine"

module Zpages

  # configure plugin
  #   Usage example:
  #     Zpages.configure do |config|
  #       config.template_path = '/path/to/templates'
  #       config.config_files = ['/file1.yml','file2.yml']
  #     end
  #
  # @param Zpages::Configuration configuration
  def self.configure(configuration = Zpages::Configuration.new)
    yield configuration if block_given?
    @@configuration = configuration
  end

  # get the configuration object
  # @return Plugin::Configuration.new
  def self.configuration
    @@configuration ||= Plugin::Configuration.new
  end

  autoload :Configuration, 'zpages/configuration'
  autoload :Page,          'zpages/page'


  module Attribute
    autoload :Base,      'zpages/attribute/base'
    autoload :String,    'zpages/attribute/string'
    autoload :Html,      'zpages/attribute/html'
  end
end
