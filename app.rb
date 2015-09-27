require_relative 'config/environment'

class DocumentGifApp < Sinatra::Base
  get '/' do
    erb :hello_world
  end
end