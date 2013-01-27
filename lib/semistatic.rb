require "semistatic/engine"
require 'paperclip'

module Semistatic

  # configure plugin
  #   Usage example:
  #     Semistatic.configure do |config|
  #       config.template_path = '/path/to/templates'
  #       config.config_files = ['/file1.yml','file2.yml']
  #     end
  #
  # @param Semistatic::Configuration configuration
  def self.configure(configuration = Semistatic::Configuration.new)
    yield configuration if block_given?
    @@configuration = configuration
  end

  # get the configuration object
  # @return Semistatic::Configuration.new
  def self.configuration
    @@configuration ||= Semistatic::Configuration.new
  end

  autoload :Configuration,      'semistatic/configuration'

  module Config
    autoload :Page,             'semistatic/config/page'

    module Attribute
      autoload :Base,      'semistatic/config/attribute/base'
      autoload :Html,      'semistatic/config/attribute/html'
      autoload :Image,     'semistatic/config/attribute/image'
      autoload :String,    'semistatic/config/attribute/string'
    end
  end

  module Concerns
    module Controllers
      autoload :PagesController,     'semistatic/concerns/controllers/pages_controller'
      autoload :PageViewController,  'semistatic/concerns/controllers/page_view_controller'
    end
  end

  module Presenters
    autoload :PagePresenter,     'semistatic/presenters/page_presenter'
  end
end
