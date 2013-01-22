module Zpages
  class Page < ActiveRecord::Base
    attr_accessible :slug, :title, :template_name
  end
end
