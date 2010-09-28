class Presentation < ActiveRecord::Base
  belongs_to :event
  belongs_to :user
  has_attached_file :slide_deck
  has_attached_file :video
  before_update :normalize_slide_deck_name

  def process_slide_deck
    if self.slide_deck_content_type == 'application/pdf'
      if self.slide_deck_updated_at.to_i - Time.now.to_i < 2.minutes.to_i
        Delayed::Job.enqueue PresentationJob.new(self.slide_deck.path, swf_path)
      end
    end
  end
  
  def swf_file_exists?
    File.exists?(swf_path)
  end
  
  def swf_path
    self.slide_deck.path.gsub(/.pdf$/,'.swf')
  end
  
  def swf_url
    self.slide_deck.url.gsub(/.pdf/,'.swf')
  end
  
  private
  def normalize_slide_deck_name
    name = self.slide_deck_file_name
    self.slide_deck.instance_write(:file_name, name.downcase.gsub(/\s+/, '_'))
  end
end

