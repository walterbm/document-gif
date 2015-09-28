class Document

  def initialize(file_path,interval=200)
    @pdf = MiniMagick::Image.open(file_path)
    @interval = interval
  end

  def to_gif
    convert_to_animated_gif
    cleanup
  end

  def convert_to_animated_gif
    MiniMagick::Tool::Convert.new do |convert|
      convert.delay(@interval) 
      convert << @pdf.path
      convert << "-loop" << "0"
      convert << "./result/animated.gif"
    end 
  end

end