module PresentationHelper
  def show_slide_deck
    if @presentation.swf_file_exists?
      render :partial => 'flash_viewer'
    end
  end

  def all_users
    User.all
  end
end
