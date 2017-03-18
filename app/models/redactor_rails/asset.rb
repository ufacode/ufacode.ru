# frozen_string_literal: true
class RedactorRails::Asset < ActiveRecord::Base
  include RedactorRails::Orm::ActiveRecord::AssetBase
  delegate :url, :current_path, :size, :content_type, :filename, to: :data
  validates :data, presence: true
end

# == Schema Information
#
# Table name: redactor_assets
#
#  assetable_id      :integer
#  assetable_type    :string(30)
#  created_at        :datetime         not null
#  data_content_type :string(255)
#  data_file_name    :string(255)      not null
#  data_file_size    :integer
#  height            :integer
#  id                :integer          not null, primary key
#  type              :string(30)
#  updated_at        :datetime         not null
#  user_id           :integer
#  width             :integer
#
# Indexes
#
#  idx_redactor_assetable       (assetable_type,assetable_id)
#  idx_redactor_assetable_type  (assetable_type,type,assetable_id)
#
