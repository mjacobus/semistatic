module ZPages
  class Configuration

    def initialize
      @templates_path = Rails.root. + 'app/views/layout'
      @config_files = [(Rails.root. + 'config/zpages.yml')]
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
  end
end