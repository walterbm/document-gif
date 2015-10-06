desc "Clean /tmp directory and remove converted gifs"
task :cron do
  puts "Cleaning up /tmp & /complete directories and removing all converted .gifs"
  FileUtils.rm_rf(Dir.glob('tmp/*.gif'))
  FileUtils.rm_rf(Dir.glob('complete/*.gif'))
  puts "/tmp and /complete directories empty"
end