class Image < ApplicationRecord
  has_one_attached :avatar

  validates :comment,    length: { maximum: 50 }

  validate :avatar_presence


    def avatar_presence
      if avatar.attached?
        if !avatar.content_type.in?(%('image/jpeg image/png'))
          errors.add(:avatar, 'にはjpegまたはpngファイルを添付してください')
        end
      else
        errors.add(:avatar, 'ファイルを添付してください')
      end
    end
  end
