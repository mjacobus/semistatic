require "zpages/engine"

module ZPages

  # configure plugin
  #   Usage example:
  #     ZPages.configure do |config|
  #       config.template_path = '/path/to/templates'
  #       config.config_files = ['/file1.yml','file2.yml']
  #     end
  #
  # @param ZPages::Configuration configuration
  def self.configure(configuration = ZPages::Configuration.new)
    yield configuration if block_given?
    @@configuration = configuration
  end

  # get the configuration object
  # @return Plugin::Configuration.new
  def self.configuration
    @@configuration ||= Plugin::Configuration.new
  end

  autoload :Configuration, 'zpages/configuration'
end
