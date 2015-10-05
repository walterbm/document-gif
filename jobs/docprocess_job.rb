class DocprocessJob
  include SuckerPunch::Job

  def perform(file_path,size,interval)
    pdf = Document.new(file_path,size,interval)
    pdf.to_gif
    pdf.gif_file_name
  end
end