class ApplicationController < ActionController::Base
    rescue_from ActiveRecord::RecordNotFound, with: :not_found
    rescue_from NoMethodError, with: :not_found

    include Pundit::Authorization
    
    def not_found 
        render status:404
    end

    def after_sign_in_path_for(resource)
       personals_path
    end

    def after_sign_out_path_for(resource)
        root_path
    end
    
end
