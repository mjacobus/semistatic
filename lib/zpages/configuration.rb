require 'yaml'

module Zpages
  class Configuration
    class Error < StandardError; end

    def initialize
      @templates_path = Rails.root. + 'app/views/layout'
      @config_files = [(Rails.root. + 'config/zpages.yml')]
      @config = HashWithIndifferentAccess.new({pages: {}})
    end

    # set the template path
    # @param Pathname path
    def templates_path=(path)
      @templates_path = path
    end

    # get the template path
    # @return Pathname
    def templates_path
      @templates_path
    end

    # set the config files
    # @param Array[Pathname] files # the filepaths in a array
    def config_files=(files)
      @config_files = files
    end

    # get the config files
    # @return Array # the filepaths in a array
    def config_files
      @config_files
    end

    # load config from files
    def load
      config_files.each do |file|
        config = YAML::load(File.open(file))
        config['pages'].each do |name, config|
          @config[:pages][name] = self.class.factory_page(name, config)
        end
      end
    end

    # @return Hash
    def pages
      @config[:pages]
    end

    # @param Symbol key
    # @return hash
    def page(key)
      page = pages[key]
      raise Error.new("There is no page named '#{key}'") unless page
      page
    end

    # @param String name # => the page name
    # @param Hash config # => the configuration
    #                    { attributes: {
    #                      title: { type: :string },
    #                      body: { type: :html }
    #                     }}
    def self.factory_page(name, config)
      Zpages::Config::Page.new(name, config)
    end
  end
end