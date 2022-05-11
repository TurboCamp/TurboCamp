class ApplicationController < ActionController::Base
    
    rescue_from ActiveRecord::RecordNotFound, with: :not_found
    
    include Pundit::Authorization

    def not_found 
        render file:"#{Rails.root}/public/404.html",
        status: 404,
        layout: false
    end

    def after_sign_in_path_for(resource)
       personals_path
    end

    def after_sign_out_path_for(resource)
        root_path
    end
    
end
