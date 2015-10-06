require_relative 'config/environment'

class DocumentGifApp < Sinatra::Base
  register Sinatra::Async

  set :server, :thin
  connections = []

  get '/' do
    erb :index
  end

  post '/' do
    pdf = Document.new(params_file_path,params_size,params_interval)
    @file_name = pdf.gif_file_name
    DocprocessJob.new.async.perform(pdf)

    erb :response, :layout => false
  end

  get '/stream/:file', provides: 'text/event-stream' do
    stream(:keep_open) do |out|
      connections << out
      # FileCheck.complete?(params[:file],out)
      out << "data: #{params[:file]} \n\n"
      # purge dead connections
      connections.reject!(&:closed?)
    end
  end

  get '/gif/:file' do 
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