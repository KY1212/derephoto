class Like < ApplicationRecord

  belongs_to :image, counter_cache: :likes_count
  belongs_to :user
  validates_uniqueness_of :image_id, scope: :user_id

end
