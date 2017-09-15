require 'dolla/upload_base'

module Dolla
  class Image < Dolla::UploadBase

    def upload_attributes
      attributes.merge({file: file})
    end

    def file
      @file
    end

    def file=(options)
      @mime_type = options[:mime_type]

      @file = Faraday::UploadIO.new(options[:path_to_file], options[:mime_type])
    end

    def self.requestor
      @requestor ||= requestor_class.new(self, :image)
    end

    # def save
    #   raise "product_id or variant_id should be provided" if self.product_id.nil? and self.variant_id.nil?

    #   payload = self.serializable_hash

    #   payload[:file_type] = @mime_type

    #   resource_base = 'products'
    #   resource_id = self.product_id

    #   if self.variant_id.present?
    #     resource_base = 'variants' 
    #     resource_id = self.variant_id
    #   end

    #   resp = self.class.connection.post "#{resource_base}/#{resource_id}/images", image: payload

    #   # puts resp.inspect

    #   # self.class.save_object(@connection, product_id, payload)
    # end
  end
end