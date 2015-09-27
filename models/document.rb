class Document

  def initialize(params)
    @pdf = DocConvert.new(params[:document][:tempfile].path)
  end

  def to_gif
    "HELLO? YES THIS IS DOG"
  end

  def convert_pages
    @pdf.convert_pages
  end

  def page_count
    @pdf.page_count  
  end

  private

    def doc_params

    end
end