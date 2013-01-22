module Zpages
  class Page < ActiveRecord::Base
    attr_accessible :slug, :title, :template_name

    has_many :attributes
    accepts_nested_attributes_for :attributes

    validates :slug, presence: true, uniqueness: { case_sensitive: false }
    validates :title, presence: true
  end
end
