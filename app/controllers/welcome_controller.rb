class WelcomeController < ApplicationController
  def index
    @presentations = Presentation.all(:limit => 3, :conditions => "video_file_size IS NOT NULL")
    @events = Event.all(:conditions => ['date >= ?', Time.now], :order => "date ASC", :limit => 3)
  end
end
