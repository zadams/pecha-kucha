class Presentation < ActiveRecord::Base
  belongs_to :event
  belongs_to :user
  has_attached_file :slide_deck
  has_attached_file :video
  before_update :normalize_slide_deck_name
  after_update :process_slide_deck, :process_video

  def swf_file_exists?
    if swf_path
      File.exists?(swf_path)
    else
      false
    end
  end
  
  def ogg_file_exists?
    if ogg_path
      File.exists?(ogg_path)
    else
      false
    end
  end
  
  def swf_path
    self.slide_deck.path.gsub(/.pdf$/,'.swf') if self.slide_deck? && self.slide_deck.path
  end
  
  def swf_url
    self.slide_deck.url.gsub(/.pdf/,'.swf')
  end
  
  def ogg_path
    self.video.path.gsub(/.m4v$/,'.ogv') if self.video? && self.video.path
  end
  
  def screen_shot_path
    self.video.path.gsub(/.m4v$/,'.png') if self.video? && self.video.path
  end
  
  def ogg_url
    self.video.url.gsub(/.m4v/,'.ogv')
  end

  def screen_shot_url
    self.video.url.gsub(/.m4v/,'.png')
  end
  
  private

  def process_slide_deck
    Rails.logger.debug("process_slide_deck called for #{self.slide_deck.path}")
    if self.slide_deck_content_type == 'application/pdf'
      if self.slide_deck_updated_at.to_i - Time.now.to_i < 2.minutes.to_i
        Delayed::Job.enqueue PresentationJob.new(self.slide_deck.path, swf_path, 'slide_deck')
      end
    end
  end
  
  def process_video
    Rails.logger.debug("process_video called for #{self.video.path}")
    if self.video_content_type == 'video/x-m4v'
      if self.video_updated_at.to_i - Time.now.to_i < 2.minutes.to_i
        Delayed::Job.enqueue PresentationJob.new(self.video.path, ogg_path, 'video')
        Delayed::Job.enqueue PresentationJob.new(self.video.path, screen_shot_path, 'screenshot')
      end
    end
  end

  def normalize_slide_deck_name
    if self.slide_deck?
      name = self.slide_deck_file_name
      self.slide_deck.instance_write(:file_name, name.downcase.gsub(/\s+/, '_')) if name
    end
  end
end

