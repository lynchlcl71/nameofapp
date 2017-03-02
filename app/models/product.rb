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
    if comments.present?
      comments.rating_desc.first
    end
  end

  def lowest_rating_comment
    if comments.present?
      comments.rating_desc.last
    end
  end

  def average_rating
    comments.average(:rating).to_f
  end 

  def count_ratings
    comments.count(:rating).to_int
  end

  def views
    $redis.get("product:#{id}") # this is equivalent to 'GET product:1'
  end

  def viewed!
    $redis.incr("product:#{id}") # this is equivalent to 'INC product:1'
  end

end