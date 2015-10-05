require_relative 'config/environment'

class DocumentGifApp < Sinatra::Base

  get '/' do
    erb :index
  end

  post '/' do
    @file_name = DocprocessJob.async.perform(params_file_path,params_size,params_interval)
  
    erb :result, :layout => false
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

    def params_size
      params[:size]
    end

    def params_interval
      params[:interval]
    end

end