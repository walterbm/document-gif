class Document

  def initialize(params)
    @pdf = Grim.reap(params[:document][:tempfile].path)
  end

  def gif
    "HELLO? YES THIS IS DOG"
  end

  def page_count
    @pdf.count  
  end

  private

    def doc_params

    end
end