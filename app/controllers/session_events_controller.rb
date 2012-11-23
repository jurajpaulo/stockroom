class SessionEventsController < ApplicationController
  before_filter :authenticate_user
  helper_method :sort_column

  def index
    @session_events = SessionEvent.joins(:user).order(sort_column + ' ' + sort_direction + ', session_events.id')
  end

  #sets sorting column default and protects against sql injection
  def sort_column
    session[:sort] = (SessionEvent.column_names + ['users.email', 'session_events.created_at']).include?(params[:sort]) ? params[:sort] : "id"
  end
end
