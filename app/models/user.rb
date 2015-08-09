class User < ActiveRecord::Base
  has_many :created_quotes, class_name: 'Quote', foreign_key: :poster_id

  def self.find_or_create_from_auth_hash(auth_hash)
    provider = auth_hash[:provider]
    uid = auth_hash[:uid]
    nickname = auth_hash[:info][:nickname]
    name = auth_hash[:info][:name]
    image_url = auth_hash[:info][:image]

    user = User.find_or_create_by(provider: provider, uid: uid) do |user|
      user.nickname = nickname
      user.name = name
      user.image_url = image_url
    end

    user.assign_attributes(nickname: nickname, name: name, image_url: image_url)

    user.save! if user.changed?

    user
  end
end
