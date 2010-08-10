class EventsController < ApplicationController
  def create
    if Event.create!(params[:event])
      render :text => 'OK', :status => 200
    else
      render :text => 'FAIL', :status => 400
    end
  end
  
  def list
    @events = Event.all(:limit => params[:limit], :order => "date DESC")
    render :partial => 'list', :locals => { :events => @events }
  end
end