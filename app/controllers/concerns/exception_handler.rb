require 'active_support/concern'

module ExceptionHandler extend ActiveSupport::Concern

included do
  include ActiveSupport::Rescuable
  rescue_from ActionController::ParameterMissing, with: :missing_param_response

end

def missing_param_response(message)
  render json: {error: message}, status: 422
end
end
