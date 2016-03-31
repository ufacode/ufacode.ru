require 'rails_helper'

RSpec.describe Social, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

# == Schema Information
#
# Table name: socials
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  value      :text(65535)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
