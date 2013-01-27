module Semistatic
  class Part < ActiveRecord::Base
    belongs_to :page
    attr_accessible :name, :value, :file

    serialize :options, HashWithIndifferentAccess

    has_attached_file :file,
      styles: lambda { |attachment| attachment.instance.options[:styles] }

    # attachment validation
    validates_attachment_presence :file, if: :is_file?
    validates_attachment_size :file, :less_than => 5.megabytes
    # TODO: Learn how to validate depending on the options, lambda maybe
    validates_attachment_content_type :file, content_type: ['image/jpeg', 'image/png', 'image/gif']

    validates :name, presence: true, uniqueness: { case_sensitive: false, scope: :page_id }
    validates :page, presence: true


    # is this is an image?
    def is_image?
      type == :image
    end

    # is this a file?
    def is_file?
      is_image? || type == :file
    end

    # @return Symbol
    def type
      options[:type].to_sym if options[:type]
    end

    # force options to be a HashWithIndifferentAccess
    # @param (nil | Hash | HashWithIndifferentAccess)
    def options=(options)
      unless options.nil? || options.class == HashWithIndifferentAccess
        options = HashWithIndifferentAccess.new(options)
      end
      write_attribute(:options, options)
    end


    def valid_content_type
      if is_image?
         ['image/jpg', 'image/png', 'image/gif']
      else
        []
      end
    end
  end
end