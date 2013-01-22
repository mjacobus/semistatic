module Zpages
  class Part < ActiveRecord::Base
    belongs_to :page
    attr_accessible :name, :value, :file

    validates :page, presence: true
    validates :name, presence: true, uniqueness: { case_sensitive: false, scope: :page_id }
  end
end