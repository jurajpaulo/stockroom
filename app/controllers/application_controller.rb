class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :sort_direction, :current_user

  private

  # helps with sql sort direction and sql injection protection
  def sort_direction
    session[:direction] = %w[asc desc].include?(params[:direction]) ? params[:direction] : session[:direction] || "asc"
  end

  def authenticate_user
    redirect_to log_in_path unless current_session
  end
  
  def current_session
    @current_session ||= Session.find_active_session(session[:session_id]) 
  end
  
  def current_user
    @current_user ||= current_session.user if current_session
  end
end
