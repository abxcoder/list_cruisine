class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    # load_and_authorize_resource
    rescue_from CanCan::AccessDenied do |exception|
        redirect_to '/', :alert => exception.message
    end

    module CurrentUser
        def self.included(base)
          base.send :helper_method, :current_user
        end
      end
      
end
