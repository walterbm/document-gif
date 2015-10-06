require 'bundler'
Bundler.require(:default)

require_relative '../jobs/docprocess_job.rb'
require_relative '../jobs/filecheck_job.rb'

require_relative '../models/document.rb'
require_relative '../models/file_check.rb'