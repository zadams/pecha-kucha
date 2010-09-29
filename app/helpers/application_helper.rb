# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def show_video(p,dimensions = nil)
    if p.video?
      if request.user_agent =~ /firefox/i && p.ogg_file_exists?
        render :partial => 'presentations/video_tag', :locals => {:video_url => p.video.url.gsub(/.m4v/,'.ogv'), :dimensions => dimensions}
      else
        render :partial => 'presentations/video_tag', :locals => {:video_url => p.video.url, :dimensions => dimensions}
      end
    end
  end
end
