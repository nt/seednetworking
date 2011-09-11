class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private
  
  def load_event
    @event = Event.find(params[:event_id])
  end
  
end
