class Observation < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true

  default_scope -> { order(created_at: :desc) }
  
  geocoded_by :address
  after_validation :geocode

  enum :license, { "CCZ": 0, "CC-BY": 1, "CC-BY-SA": 2, "CC-BY-NC": 3, "CC-BY-NC-SA": 4, "CC-BY-ND": 5, "CC-BY-NC-ND": 6} 

  paginates_per 4
#  validates :title, presence: true
#  {message: 'Title required'}
#  validates :address, presence: true
#  {message: 'You must at least specify a country'}

  has_one_attached :pic do |attachable|
    attachable.variant :mysmall, resize_to_limit: [400,400]
  end

  validates :pic, presence: true
  {message: "You must choose an image"}

  def address
    [street,city,state,country].compact.join(',')
  end

end
