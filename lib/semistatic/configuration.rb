require 'yaml'

module Semistatic
  class Configuration
    class Error < StandardError; end

    def initialize
      @templates_path = Rails.root. + 'app/views/layout'
      @config_files = [(Rails.root. + 'config/semistatic.yml')]
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
        @config.merge! config
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

  end
end