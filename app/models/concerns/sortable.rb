module Sortable
  extend ActiveSupport::Concern

  included do
    scope :newest, ->{ order('created_at DESC') }
  end
end