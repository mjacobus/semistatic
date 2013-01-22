module Zpages
  class Part < ActiveRecord::Base
    belongs_to :page
    attr_accessible :name, :value, :file

    validates :page, presence: true
    validates :name, presence: true
  end
end