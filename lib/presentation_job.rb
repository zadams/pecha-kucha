class PresentationJob < Struct.new(:original_file, :new_file)
  def perform
    `pdf2swf #{original_file} #{new_file}`
  end
end