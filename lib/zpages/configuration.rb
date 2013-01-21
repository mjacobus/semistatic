module ZPages
  class Configuration

    def initialize
      @templates_path = Rails.root. + 'app/views/layout'
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
  end
end