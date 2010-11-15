class PresentationJob < Struct.new(:original_file, :new_file, :type)
  def perform
    if File.exists?(original_file)
      command = "pdf2swf #{original_file} #{new_file}" if type == 'slide_deck'
      command = "ffmpeg2theora #{original_file} -o #{new_file}" if type == 'video'
      command = "ffmpeg -ss 0 -i #{original_file} -an -vframes 1 #{new_file}" if type == 'screenshot'
    end

    if command
      `#{command}`
    else
      raise
    end
  end
end
