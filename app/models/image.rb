class Image
  include Mongoid::Document
  include Mongoid::Paperclip
  include Mongoid::Taggable

  field :thinkstock_id, type: String

  has_mongoid_attached_file :attachment,
    :path           => ":class/:attachment/:id/:basename_:style.:extension",
    :storage        => :s3,
    :s3_credentials => File.join(Rails.root, 'config', 'aws.yml'),
    s3_permissions: :private,
    :styles => {
      :thumb => "300x300>"
    }
end