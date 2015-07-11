class Author < ActiveRecord::Base
  mount_uploader :author_image, AuthorImageUploader

  validates :name, length: { maximum: 100 }, presence: true
  validates :birthplace, length: { maximum: 200 }
  validates :birthday, length: { maximum: 100 }
  validates :deathday, length: { maximum: 100 }
end
