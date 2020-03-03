class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :image, :counter_cache => true
  validates :content, presence: true, length: { in: 1..70 } #0以上70未満

end
