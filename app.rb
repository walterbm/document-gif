require_relative 'config/environment'

class DocumentGifApp < Sinatra::Base

  get '/' do
    erb :index
  end

  post '/' do
    pdf = Document.new(params)
    "PDF (#{pdf.page_count} pages) SUCCESSFULLY UPLOADED!"
  end

end