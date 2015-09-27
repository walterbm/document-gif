class Document

  def initialize(file_path)
    @pdf = MiniMagick::Image.open(file_path)
  end

  def to_gif
    convert_pages
    convert_to_animated_gif
  end

  def convert_pages
    @pdf.pages.each_with_index do |page, index|
      page.write("./temp/test#{"%03d" % index}.gif")
    end
  end

  def page_count
    @pdf.pages.count
  end

  def convert_to_animated_gif
    MiniMagick::Tool::Convert.new do |convert|
      convert.delay(120) 
      convert << "./temp/test*.gif"
      convert << "-loop" << "0"
      convert << "./result/animated.gif"
    end
    FileUtils.rm_rf(Dir.glob('temp/*'))
  end

end