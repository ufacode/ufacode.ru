module Sortable
  extend ActiveSupport::Concern

  included do
    scope :newest, ->{ order('created_at DESC') }
    scope :alphabetical, ->{ order(name: :ASC) }
  end
end
