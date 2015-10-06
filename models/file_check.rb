require 'timeout'

class FileCheck

  def initialize(file_name,client)
    @path = "./complete/#{file_name}"
    @client = client
  end

  def complete?
    begin
      Timeout::timeout(60) do
        loop do
          if File.exist?(@path)
            @client << "data: true\n\n"
            break
          else
            sleep(2)
          end
        end
      end
    rescue Timeout::Error
      @client << "data: false\n\n"
    end
  end

end