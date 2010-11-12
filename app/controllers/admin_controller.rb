class AdminController < ApplicationController
  before_filter :authenticate_user!
  before_filter :validate_admin
  
  def index
    @events = Event.all(:limit => 3)
    @allevents = Event.all
    @event = Event.new
    @event_locations = Event.all.collect { |e| e.location }
  end
  
  private

  def validate_admin
    redirect_to root_path if current_user.nil? or !current_user.admin?
  end

end
