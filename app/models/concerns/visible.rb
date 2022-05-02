module Visible
  extend ActiveSupport::Concern 

  VALID_STATUSES = ['public', 'draft']
  included do
    validates :status, inclusion: { in: VALID_STATUSES }
  end
  

  def public?
    status == 'public'
  end


end