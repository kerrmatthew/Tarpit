namespace :dev do
  desc "development rake tasks"
  task :restart do
    FileUtils.touch("/Users/matthewkerr/Sites/tarpit/tmp/restart.txt")
  end
end