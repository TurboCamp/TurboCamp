# frozen_string_literal: true

module Visible
  extend ActiveSupport::Concern

  VALID_STATUSES = %w[public draft].freeze
  included do
    validates :status, inclusion: { in: VALID_STATUSES }
  end

  def public?
    status == 'public'
  end
end
