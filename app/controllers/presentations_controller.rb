class PresentationsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show, ]

  def index
    @presentations = Presentation.all
  end

  def show
    @presentation = Presentation.find(params[:id])
  end

  def list
    @presentations = current_user.presentations if current_user
  end

  def new
    @presentation = Presentation.new
    @available_events =  load_events
  end

  def create
    if p = current_user.presentations.create!(params[:presentation])
      render :template => 'create'
    else
      render :action => :index
    end
  end

  def edit
    @presentation = Presentation.find_by_id(params[:id])
    unless @presentation.user.eql?(current_user) || admin_signed_in?
      render :action => :index
    end
    @available_events = load_events('all')
  end

  def update
    @presentation = Presentation.find(params[:id])
    if @presentation.update_attributes(params[:presentation])
      flash[:notice] = 'Your presentation has been updated'
      redirect_to(@presentation)
    else
      render :action => :edit
    end
  end

  private

  def authenticate
    admin_signed_in? || user_signed_in?
  end

  def load_events(type = nil)
    if params[:event_id] && current_user.admin? && event = Event.find_by_id(params[:event_id])
      @events = [event]
    elsif type == 'all'
      @events = Event.all(:order => "date ASC")
    else
      @events = Event.all(:conditions => ['date >= ?', Time.now], :order => "date ASC")
    end
    @events
  end

end
