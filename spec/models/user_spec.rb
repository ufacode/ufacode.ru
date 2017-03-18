RSpec.describe User, type: :model do
  it 'is valid factory :user' do
    expect(create(:user)).to be_valid
    # to have(1).error_on(:name)
  end

  it 'checks empty user name' do
    user = build(:user, name: nil)
    user.valid?
    expect(user.errors[:name]).to include I18n.t('errors.messages.blank')
  end

  it 'checks empty user email' do
    user = build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include I18n.t('errors.messages.blank')
  end

  it 'take uniq emails' do
    info = FactoryGirl.attributes_for(:user)
    User.create(info)
    user2 = User.new(info)
    user2.valid?
    expect(user2.errors[:email]).to include I18n.t('errors.messages.taken')
  end
end

# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  name                   :string(255)
#  image                  :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string(255)
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
