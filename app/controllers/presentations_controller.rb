class PresentationsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @presentation = Presentation.new
    @events = Event.all(:conditions => ['date >= ?', Time.now], :order => "date ASC")
  end
  
  def create 
    if Presentation.create!(params[:presentation])
      render :partial => 'thank_you'
    else
      render :action => :index
    end
  end
  
end