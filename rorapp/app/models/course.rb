class Course < ApplicationRecord
  mount_uploader :thumbnail, ImageUploader
  has_many :chapters, :dependent => :destroy
end
