# frozen_string_literal: true
class Rating < ApplicationRecord
  belongs_to :ratingable, polymorphic: true
  belongs_to :user

  validates :ratingable, :user, presence: true
end

# == Schema Information
#
# Table name: ratings
#
#  amount          :integer          default(0)
#  created_at      :datetime         not null
#  id              :integer          not null, primary key
#  ratingable_id   :integer
#  ratingable_type :string(255)
#  updated_at      :datetime         not null
#  user_id         :integer
#
# Indexes
#
#  index_ratings_on_ratingable_type_and_ratingable_id  (ratingable_type,ratingable_id)
#  index_ratings_on_user_id                            (user_id)
#
