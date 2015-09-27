require_relative 'config/environment'

class DocumentGifApp < Sinatra::Base
  get '/' do
    "HELLO WORLD!"
  end
end