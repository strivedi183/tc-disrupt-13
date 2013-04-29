class WelcomeController < ApplicationController
  def index
    @events = Event.where(:is_view_public? == true)
  end
end