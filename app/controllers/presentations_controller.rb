class PresentationsController < ApplicationController
  before_filter :authenticate_user!, :action => [:index, :create]
  before_filter :authenticate, :action => [:edit, :update]
  
  def index
    @presentation = Presentation.new
    load_events
  end
  
  def create 
    if current_user.presentations.create!(params[:presentation])
      render :partial => 'thank_you'
    else
      render :action => :index
    end
  end
  
  def edit
    @presentation = Presentation.find_by_id(params[:id])
    load_events
  end
  
  def update
    if Presentation.update(params[:presentation])
      render :partial => 'thank_you'
    else
      render :action => :edit
    end
  end
  
  private
  
  def authenticate
    admin_signed_in? || user_signed_in?
  end
  
  def load_events
    @events = Event.all(:conditions => ['date >= ?', Time.now], :order => "date ASC")
  end
  
end