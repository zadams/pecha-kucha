class AdminController < ApplicationController
  before_filter :authenticate_admin!
  
  def index
    @events = Event.all(:limit => 10)
    @event = Event.new
  end
  
end