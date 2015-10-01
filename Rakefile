desc "Clean /tmp directory and remove converted gifs"
task :cron do
  puts "Cleaning up /tmp directory and removing all converted .gifs"
  FileUtils.rm_rf(Dir.glob('tmp/*.gif'))
  puts "/tmp directory empty"
end