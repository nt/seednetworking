class EventsController < ApplicationController

  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def latest
    @event = Event.last
    redirect_to @event
  end
  
  def explanation
  end

end
