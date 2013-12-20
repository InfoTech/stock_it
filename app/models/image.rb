class Image
  include Mongoid::Document
  include Mongoid::Paperclip
  include Mongoid::Taggable

  field :thinkstock_id, type: String

  has_mongoid_attached_file :attachment,
    :path           => ":class/:attachment/:id/:basename_:style.:extension",
    :storage        => :s3,
    :s3_credentials => {
      :bucket => 'stockit.infotech.com',
      :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
      :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
    },
    s3_permissions: :private,
    s3_headers: { 'Content-Disposition' => 'attachment' },
    :styles => {
      :thumb => "300x300#"
    }

    def dimensions
      geometry = Paperclip::Geometry.from_file(self.attachment.expiring_url)
      "#{geometry.width.to_i} x #{geometry.height.to_i}"
    end
end