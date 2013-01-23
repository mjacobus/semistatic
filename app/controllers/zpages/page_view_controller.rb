require_dependency "zpages/application_controller"

module Zpages
  class PageViewController < ApplicationController
    include Zpages::Concerns::Controllers::PageViewController
  end
end
