class RedactorRails::Asset < ActiveRecord::Base
  include RedactorRails::Orm::ActiveRecord::AssetBase
  delegate :url, :current_path, :size, :content_type, :filename, :to => :data
  validates_presence_of :data
end

# == Schema Information
#
# Table name: redactor_assets
#
#  id                :integer          not null, primary key
#  user_id           :integer
#  data_file_name    :string(255)      not null
#  data_content_type :string(255)
#  data_file_size    :integer
#  assetable_id      :integer
#  assetable_type    :string(30)
#  type              :string(30)
#  width             :integer
#  height            :integer
#  created_at        :datetime
#  updated_at        :datetime
#
# Indexes
#
#  idx_redactor_assetable       (assetable_type,assetable_id)
#  idx_redactor_assetable_type  (assetable_type,type,assetable_id)
#
