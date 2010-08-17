class AdminController < ApplicationController
  before_filter :authenticate_admin!
  
  def index
    @events = Event.all(:limit => 3)
    @allevents = Event.all
    @event = Event.new
    @event_locations = Event.all.collect { |e| e.location }
  end
  
end
