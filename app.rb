require_relative 'config/environment'

class DocumentGifApp < Sinatra::Base

  get '/' do
    erb :index
  end

  post '/' do
    pdf = Document.new(params_file_path)
    pdf.to_gif
    "PDF SUCCESSFULLY UPLOADED! & CONVERTED!"
  end

  get '/download' do
    send_file './result/animated.gif', type: :gif #, disposition: :attachment
  end

  private

    def params_file_path
      params[:document][:tempfile].path
    end

end