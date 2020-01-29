class Like < ApplicationRecord

  belongs_to :image, counter_cache: :likes_count
  belongs_to :user

end
