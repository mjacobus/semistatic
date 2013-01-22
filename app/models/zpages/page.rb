module Zpages
  class Page < ActiveRecord::Base
    attr_accessible :slug, :title
  end
end
