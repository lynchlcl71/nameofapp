class Product < ApplicationRecord
  has_many :orders
  has_many :comments
  def highest_rating_comment
    comments.rating_desc.first
  end
  def average_rating
    comments.average(:rating).to_f
  end

  def views
    $redis.get("product:#{id}")
  end

  def viewed!
    $redis.incr("product:#{id}")
  end
  validates :name, presence: true
end
