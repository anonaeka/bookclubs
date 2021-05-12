class ApplicationController < ActionController::Base
    include Pundit

    rescue_from Pundit::NotAuthorizedError, with: :forbinded

    private

    def forbinded
        flash[:alert] = "You are not authorized to perform that action."
        redirect_to request.referrer || root_path
    end
end
