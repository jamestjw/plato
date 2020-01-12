class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    skip_before_action :verify_authenticity_token   
    
    private
    def owns_organisation(org)
        unless org.contains_user?(current_user) || admin_signed_in? 
          redirect_back(fallback_location: root_url, alert: "You do not own this organisation.")
        end
    end
end
