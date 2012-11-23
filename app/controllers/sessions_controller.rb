class SessionsController < ApplicationController

  def new
    @session = Session.new
  end
  
  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      #session expires in 1 hour
      @session = Session.new(:id => session[:session_id], :user_id => user.id, :expires_at => 1.hour.from_now)
      if @session.save
        flash[:notice] = "Successfully logged in!"
        redirect_to root_url
      else
        flash.now.alert = "Unexpected session error."
        render :action => 'new'
      end
    else
      flash.now.alert = "Invalid email or password."
      render :action => 'new'
    end
  end
  
  def destroy
    @session = Session.find_by_id(session[:session_id])
    @session.destroy if @session
    flash[:notice] = "Successfully logged out."
    redirect_to root_url
  end
end
