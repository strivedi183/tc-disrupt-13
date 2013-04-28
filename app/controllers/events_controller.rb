class EventsController < ApplicationController
  def index
    @events = Event.where(:is_view_public? == true)
  end
  def show
  end
end