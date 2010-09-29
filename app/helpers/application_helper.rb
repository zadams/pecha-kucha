# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def show_video(p,dimensions = {:height => '360px', :width => '640px'})
    if p.video?
      render :partial => 'presentations/video_tag', :locals => {:presentation => p, :dimensions => dimensions}
    end
  end
end
