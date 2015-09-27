class DocConvert
  def initialize(file_path)
    @image_magick = MiniMagick::Image.open(file_path)
  end

  def convert_pages
    @image_magick.pages.each_with_index do |page, index|
      page.write("./temp/test#{index}.gif")
    end
  end

  def page_count
    @image_magick.pages.count
  end

end