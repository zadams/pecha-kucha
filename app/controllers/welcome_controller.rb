class WelcomeController < ApplicationController
  def index
    @presentations = Presentation.all(:limit => 3, :conditions => "video_file_size IS NOT NULL")
  end
end