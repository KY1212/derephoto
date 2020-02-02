class Like < ApplicationRecord

  belongs_to :image, counter_cache: :likes_count
  belongs_to :user
  #いいねは一人一回まで
  validates_uniqueness_of :image_id, scope: :user_id

end
