module Spree
  class Digital < ActiveRecord::Base
    belongs_to :variant
    has_many :digital_links, :dependent => :destroy
  
    has_attached_file :attachment, :path => ":rails_root/private/digitals/:id/:basename.:extension"
  
    # TODO: Limit the attachment to one single file. Paperclip supports many by default :/

    include Spree::Core::S3Support
    supports_s3 :attachment

    if Spree::Config[:use_s3]
      attachment_definitions[:attachment][:s3_permissions] = :private
      if (ENV['S3_PRIVATE_BUCKET_NAME'])
        attachment_definitions[:attachment][:bucket] = ENV['S3_PRIVATE_BUCKET_NAME']
      end
    end

    attr_accessible :variant_id, :attachment
      
  end
end

