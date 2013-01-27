require_dependency "semistatic/application_controller"

module Semistatic
  class PagesController < ApplicationController
    include Semistatic::Concerns::Controllers::PagesController
  end
end
