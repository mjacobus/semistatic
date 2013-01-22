module Zpages
  class Attribute < ActiveRecord::Base
    belongs_to :page
    attr_accessible :title, :value, :file

    validates :page, presence: true
    validates :title, presence: true
  end
end