class Document

  def initialize(file_path,interval=200,size="100%")
    @pdf = MiniMagick::Image.open(file_path)
    @interval = interval
    @size = size
  end

  def to_gif
    MiniMagick::Tool::Convert.new(false) do |convert|
      convert.delay(@interval) 
      convert << @pdf.path
      convert.alpha("remove")
      convert << "-loop" << "0"
      convert.resize(@size)
      convert << "./result/animated.gif"
    end 
  end

end