class DocConvert
  def initialize(file_path)
    @image_magick = MiniMagick::Image.open(file_path)
  end

  def convert_pages
    @image_magick.pages.each_with_index do |page, index|
      page.write("./temp/test#{index}.gif")
    end
    convert_animated_gif
  end

  def page_count
    @image_magick.pages.count
  end

  def convert_animated_gif
    MiniMagick::Tool::Convert.new do |convert|
      convert << "./temp/test*.gif"
      convert << "-delay" << "20"
      convert << "-loop" << "0"
      convert << "./result_gif/animated.gif"
    end
  end

end


