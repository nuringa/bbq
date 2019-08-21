class Subscription < ApplicationRecord
  belongs_to :event
  belongs_to :user, optional: true
  has_many :subscribers, through: :subscriptions, source: :user

  validates :user_name, presence: true, unless: -> { user.present? }
  validates :user_email, presence: true,
                         format: /\A[a-zA-Z0-9\-_.]+@[a-zA-Z0-9\-_.]+\z/,
                         unless: -> { user.present? }
  validates :user, uniqueness: { scope: :event_id }, if: -> { user.present? }

  validates :user_email, uniqueness: { scope: :event_id }, unless: -> { user.present? }

  validate :user_email_must_be_unique, on: :create, unless: -> { user.present? }
  validate :user_must_not_be_author, on: :create, if: -> { user.present? }

  def user_must_not_be_author
    errors.add(:user_id, 'errors.self_subscribe') if user == event.user
  end

  def user_name
    if user.present?
      user.name
    else
      super
    end
  end

  def user_email
    if user.present?
      user.email
    else
      super
    end
  end

  private
  def user_email_must_be_unique
    errors.add(:user_email, 'errors.user_email') if User.all.where(email: user_email).any?
  end
end
