class EventsController < ApplicationController
  def new
    @event = Event.new
  end
  def create
    binding.pry
  end
  def index
    @events = Event.where(:is_view_public? == true)
  end
  def show
    @event = Event.find(params[:id])
  end
end