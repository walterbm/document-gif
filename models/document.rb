class Document

  def initialize(file_path,interval=200)
    @pdf = MiniMagick::Image.open(file_path)
    @interval = interval
  end

  def to_gif
    MiniMagick::Tool::Convert.new(false) do |convert|
      convert.delay(@interval) 
      convert << @pdf.path
      convert << "-loop" << "0"
      convert.resize("200%")
      convert << "./result/animated.gif"
    end 
  end

end