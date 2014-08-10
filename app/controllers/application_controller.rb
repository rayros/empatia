class ApplicationController < ActionController::Base
  layout 'atheme'
  expose(:waiting_count) { Post.where(accepted: false).count }
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end
end
