class Document
  attr_reader :gif_file_name

  def initialize(file_path,size="100",interval=200)
    @pdf = MiniMagick::Image.open(file_path)
    @interval = interval
    @size = "#{size}%" 
  end

  def to_gif
    @gif = Tempfile.new(["animated",".gif"], "./tmp")
    @gif_file_name = File.basename(@gif.path)
    begin
      convert_pdf
    ensure
      @gif.close 
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
        convert << @gif.path
      end 
    end

end