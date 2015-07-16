class Quote < ActiveRecord::Base
  mount_uploader :author_image, AuthorImageUploader
  belongs_to :poster, class_name: 'User', foreign_key: :poster_id

  validates :author_name, length: { maximum: 100 }, presence: true
  validates :content, length: { maximum: 200 }, presence: true

  def created_by?(user)
    return false unless user
    poster_id == user.id
  end
end
