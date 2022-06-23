class ApplicationController < ActionController::API
  before_action :authenticate_user!
  # rescue_from ::ActiveRecord::RecordNotFound, with: :record_not_found
  # rescue_from Exception, with: :error_occurred
  # rescue_from ::ActionController::RoutingError, with: :record_not_found

  include CustomErrorRescue

  def render_resource(resource)
    if resource.errors.empty?
      render json: resource
    else
      validation_error(resource)
    end
  end

  def validation_error(resource)
    render json: {
      errors: [
        {
          status: '400',
          title: 'Bad Request',
          detail: resource.errors,
          code: '100'
        }
      ]
    }, status: :bad_request
  end

  def raise_not_found!
    message = "No route matches #{request.method.upcase} #{params[:unmatched_route]}"
    render json: { errors: { title: message } }, status: :not_found
  end
  
  protected

  def record_not_found(exception)
    render json: {error: "No record found for requested resource"}, status: 404
    return
  end

  def error_occurred(exception)
    render json: {error: "An error occured in the system."}.to_json, status: 500
    return
  end
end
