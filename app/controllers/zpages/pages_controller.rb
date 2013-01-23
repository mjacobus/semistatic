require_dependency "zpages/application_controller"

module Zpages
  class PagesController < ApplicationController
    include Zpages::Concerns::Controllers::PagesController
  end
end
