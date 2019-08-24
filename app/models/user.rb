class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :events
  has_many :comments, dependent: :destroy
  has_many :subscriptions, dependent: :destroy

  validates :name, presence: true, length: {maximum: 35}
  validates :email, presence: true, length: {maximum: 255}
  validates :email, uniqueness: true

  before_validation :set_name, on: :create

  # TODO найти этот код в виду - пока выдает ошибку если включить
  # after_commit :link_subscriptions, on: create

  mount_uploader :avatar, AvatarUploader

  private
  def set_name
    self.name = "Somebody #{rand(111)}" if self.name.blank?
  end

  # def link_subscriptions
  #   Subscription.where(user_id: nil, user_email: self.email).update_all(user_id: self.id)
  # end
end
