module Zpages
  class Page < ActiveRecord::Base
    attr_accessible :slug, :title, :template_name, :parts_attributes

    has_many :parts
    accepts_nested_attributes_for :parts

    validates :slug, presence: true, uniqueness: { case_sensitive: false }
    validates :title, presence: true

    # Factory a page from the config
    #     Creates the attributes required by the config
    # @param Zpages::Config::Page config # the page configuration
    # @return Page
    def self.factory(config)
      page = new
      page.template_name = config.name

      config.attributes.each do |name, attr|
        page.parts.build({name: attr.name})
      end

      page.save(validate: false)
      page
    end
  end
end
