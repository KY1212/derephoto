class Image < ApplicationRecord
  has_one_attached :avatar
  has_many :likes, dependent: :destroy
  has_many :liking_users, through: :likes, source: :user

  belongs_to :user
  validates :idolname, presence: true
  validates :idoltype, presence: true
  validates :mv, presence: true

  validate :avatar_presence

  def self.search(idolname) #self.でクラスメソッドとしている

    if idolname # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
      Image.where(['idolname LIKE ?', "%#{idolname}%"])

    else
      Image.all #全て表示。
    end
  end




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
