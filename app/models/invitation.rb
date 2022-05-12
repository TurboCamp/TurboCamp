class Invitation < ApplicationRecord
    before_create :generate_token

    belongs_to :user
    validates :email, presence: true
   


    def generate_token
      self.token = SecureRandom.urlsafe_base64
    end

    def clear_token
      self.update(token: nil)
    end

end
