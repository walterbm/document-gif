class Document
  attr_reader :name

  def initialize(file_path,interval=200,size="100%")
    @pdf = MiniMagick::Image.open(file_path)
    @interval = interval
    @size = size
  end

  def to_gif
    @file = Tempfile.new(["animated",".gif"], "./tmp")
    @name = File.basename(@file.path)
    begin
      convert_pdf
    ensure
      @file.close 
    end
  end

  private

    def convert_pdf
      MiniMagick::Tool::Convert.new(false) do |convert|
        convert.delay(@interval) 
        convert << @pdf.path
        convert.alpha("remove")
        convert << "-loop" << "0"
        convert.resize(@size)
        convert << @file.path
      end 
    end

end