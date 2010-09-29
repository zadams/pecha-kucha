class PresentationJob < Struct.new(:original_file, :new_file, :type)
  def perform
    puts "Checking for #{original_file}"
    if File.exists?(original_file)
      command = 'pdf2swf' if type == 'slide_deck'
      command = 'ffmpeg2theora' if type == 'video'
    end
    
    puts "Running command #{command}"
    if command
      `#{command} #{original_file} #{new_file}`
    else
      raise
    end
  end
end