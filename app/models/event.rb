class Event < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :subscriptions, dependent: :destroy
  has_many :photos

  validates :title, presence: true, length: { maximum: 255 }
  validates :address, presence: true
  validates :datetime, presence: true

  def visitors
    (subscriptions + [user]).uniq
  end
end
