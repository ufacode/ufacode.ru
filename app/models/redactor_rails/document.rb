# frozen_string_literal: true
class RedactorRails::Document < RedactorRails::Asset
  mount_uploader :data, RedactorRailsDocumentUploader, mount_on: :data_file_name

  def url_content
    url(:content)
  end

  def as_json_methods
    [:image]
  end
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
