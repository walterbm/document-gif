require_relative 'config/environment'

class DocumentGifApp < Sinatra::Base

  get '/' do
    erb :index
  end

  post '/' do
    pdf = Document.new(params_file_path)
    pdf.to_gif
    @file_name = pdf.name
    erb :result
  end

  get '/:file' do 
     send_file "./tmp/#{params[:file]}", type: :gif, disposition: :inline
  end

  get '/download/:file' do
    send_file "./tmp/#{params[:file]}", type: :gif , disposition: :attachment
  end



  private

    def params_file_path
      params[:document][:tempfile].path
    end

end