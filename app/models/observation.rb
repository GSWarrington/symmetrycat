class Observation < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true

  default_scope -> { order(created_at: :desc) }
  
  geocoded_by :address
  after_validation :geocode

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
