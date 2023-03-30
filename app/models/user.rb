class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :favorites
  has_many :movies, through: :favorites

  has_many :followed_users,
           foreign_key: :follower_id,
           class_name: 'Relationship',
           dependent: :destroy

  # This accesses the user through the relationship object.
  has_many :followees, through: :followed_users, dependent: :destroy

  # This access the Relationship object.
  has_many :following_users,
           foreign_key: :followee_id,
           class_name: 'Relationship',
           dependent: :destroy

  # This accesses the user through the relationship object.
  has_many :followers, through: :following_users, dependent: :destroy

  update_index('users') { self }

  before_save { self.email = email.downcase }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true, length: { maximum: 50 },
                        uniqueness: {case_sensitive: false}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: {case_sensitive: false}
end
