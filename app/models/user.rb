class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

has_many :images

def correct_user
  @image = current_user.images.find_by(id: params[:id])
    unless @image
      redirect_to root_url
    end
end

  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

  unless user
    user = User.create(
      uid:      auth.uid,
      provider: auth.provider,
      email:    User.dummy_email(auth),
      password: Devise.friendly_token[0, 20],
      image: auth.info.image,
      name: auth.info.name,
      nickname: auth.info.nickname
    )
  end

  user
end

private

def self.dummy_email(auth)
  "#{auth.uid}-#{auth.provider}@example.com"
end
end
