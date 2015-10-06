class DocprocessJob
  include SuckerPunch::Job

  def perform(document_object)
    @pdf = document_object
    @pdf.to_gif
    @pdf.gif_file_name
    FileUtils.mv(@pdf.gif.path, "./complete/#{@pdf.gif_file_name}")
  end
  
end