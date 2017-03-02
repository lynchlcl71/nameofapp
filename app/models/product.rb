class Product < ApplicationRecord
  has_many :orders
  #added dependent: :destroy 
  #to resolve issue in Dev.Env where 
  #Destroy method failed on Products w/ Comments
  has_many :comments, dependent: :destroy 
  
  validates :name, presence: true
  #validates :description, 
  validates :image_url, presence: true
  #validates :color, 
  validates :price, numericality: true

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
  
end
