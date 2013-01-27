module Semistatic
  class Page < ActiveRecord::Base
    attr_accessible :slug, :title, :template_name, :parts_attributes

    has_many :parts
    accepts_nested_attributes_for :parts

    validates :slug, presence: true, uniqueness: { case_sensitive: false }
    validates :title, presence: true

    # get part by its name
    # param
    # @return Part
    def part(name)
      parts.select {|p| p.name.downcase == name.to_s.downcase }.first
    end

    # Factory a page from the config
    #     Creates the attributes required by the config
    # @param String template_name
    # @param Hash options # the page configuration
    # @return Page
    def self.factory(template_name, options)
      page = new(template_name: template_name)

      options = HashWithIndifferentAccess.new(options)
      options[:parts].each do |name, attributes|
        part = page.parts.build({ name: name })
        part.options = attributes
      end

      page.save(validate: false)
      page
    end
  end
end
