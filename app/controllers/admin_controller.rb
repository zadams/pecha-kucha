class AdminController < ApplicationController
  before_filter :authenticate_user!
  before_filter :validate_admin
  
  def index
    @events = Event.all(:limit => 3, :conditions => ['date >= ?', Time.now], :order => "date ASC")
    @allevents = {:future => Event.all(:conditions => ['date >= ?', Time.now], :order => "date ASC"),
                  :past => Event.all(:conditions => ['date <= ?', Time.now], :order => "date DESC")}
    @event = Event.new
    @event_locations = Event.all.collect { |e| e.location }
  end
  
  private

  def validate_admin
    redirect_to root_path if current_user.nil? or !current_user.admin?
  end

  def load_events(which)
    Event.all(:conditions => ['date >= ?', Time.now], :order => "date ASC")
  end

end
