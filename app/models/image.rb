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
    :styles => {
      :thumb => "300x300>"
    }
end