require_dependency "semistatic/application_controller"

module Semistatic
  class PageViewController < ApplicationController
    include Semistatic::Concerns::Controllers::PageViewController
  end
end
