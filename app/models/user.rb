# frozen_string_literal: true
class User < ActiveRecord::Base
  include Sortable

  TEMP_EMAIL_PREFIX = 'change@me'
  TEMP_EMAIL_REGEX  = /\Achange@me/

  devise :database_authenticatable, :registerable, :confirmable, :recoverable,
         :rememberable, :trackable, :validatable, :omniauthable

  before_validation :set_role
  after_create :user_soc

  mount_uploader :image,     AvatarUploader
  mount_uploader :wallpaper, ImageUploader

  has_many :posts,     dependent: :destroy
  has_many :blogs,     dependent: :destroy
  has_many :providers, dependent: :destroy
  has_many :comments,  dependent: :destroy
  has_many :socials

  validates :name,  presence: true
  validates :email, format: { without: TEMP_EMAIL_REGEX }, on: :update

  enum sex: { male: 1, female: 2 }

  def full_name
    name || email
  end

  def self.find_for_oauth(auth, signed_in_resource = nil)
    # Get the identity and user if they exist
    identity = Provider.find_for_oauth(auth)

    # If a signed_in_resource is provided it always overrides the existing user
    # to prevent the identity being locked with accidentally created accounts.
    # Note that this may leave zombie accounts (with no associated identity) which
    # can be cleaned up at a later date.
    user = signed_in_resource ? signed_in_resource : identity.user

    # Create the user if needed
    if user.nil?

      # Get the existing user by email if the provider gives us a verified email.
      # If no verified email was provided we assign a temporary email and ask the
      # user to verify it on the next step via UsersController.finish_signup
      email_is_verified = auth.info.email && (auth.info.verified || auth.info.verified_email)
      email = auth.info.email if email_is_verified
      user = User.find_by(email: email) if email

      # Create the user if it's a new registration
      if user.nil?
        user = User.new(
          name: auth.extra.raw_info.name,
          # username: auth.info.nickname || auth.uid,
          email: email ? email : "#{TEMP_EMAIL_PREFIX}-#{auth.uid}-#{auth.provider}.com",
          password: Devise.friendly_token[0, 20]
        )
        user.skip_confirmation!
        user.save!
      end
    end

    # Associate the identity with the user if needed
    if identity.user != user
      identity.user = user
      identity.save!
    end
    user
  end

  def email_verified?
    email && email !~ TEMP_EMAIL_REGEX
  end

  def user_soc
    socials.create(name: :twitter)
    socials.create(name: :vk)
    socials.create(name: :github)
    socials.create(name: :linkedin)
    socials.create(name: :facebook)
    socials.create(name: :skype)
    socials.create(name: :personal_site)
  end

  private

  def set_role
    self.role = 'user' unless role
  end
end

# == Schema Information
#
# Table name: users
#
#  confirmation_sent_at   :datetime
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  created_at             :datetime         not null
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :string(255)
#  description            :text(65535)
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  id                     :integer          not null, primary key
#  image                  :string(255)
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string(255)
#  name                   :string(255)
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string(255)
#  role                   :string(255)
#  sex                    :integer          default("1")
#  sign_in_count          :integer          default("0"), not null
#  unconfirmed_email      :string(255)
#  updated_at             :datetime         not null
#  wallpaper              :string(255)
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
