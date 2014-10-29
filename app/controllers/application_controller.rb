class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

	if !Rails.env.development?
    rescue_from Exception,                        with: :render_500
    rescue_from ActiveRecord::RecordNotFound,     with: :render_404
    rescue_from ActionController::RoutingError,   with: :render_404
  end

  def routing_error
    render file: Rails.root.join('public/404.html'), status: 404, layout: false, content_type: 'text/html'
  end

	def render_404(e = nil)
    logger.info "Rendering 404 with exception: #{e.message}" if e

    if request.xhr?
      render file: Rails.root.join('public/404.html'), status: 404, layout: false, content_type: 'text/html'
    else
      render template: 'errors/error_404', status: 404, layout: 'application', content_type: 'text/html'
    end
  end

end
