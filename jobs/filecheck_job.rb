class FilecheckJob
  include SuckerPunch::Job

  def perform(file_name,client)
    FileCheck.new(file_name,client).complete?
  end
end