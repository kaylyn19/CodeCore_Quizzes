class ApplicationController < ActionController::Base
    def current_user
        
    end
    helper_method :current_user

    def user_signed_in?
    end
    helper_method :user_signed_in?

    def authenticate!
    end
end
