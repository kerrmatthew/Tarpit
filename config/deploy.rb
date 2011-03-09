set :application, "Tarpit"
set :repository,  "file:///Library/Git/tarpit.git"
set :local_repository,  "matthewkerr@wud-web.com:/Library/Git/tarpit.git"

set :deploy_to, "\"/Volumes/Macintosh HD2/alpha.tarpit/\""
set :use_sudo, false
set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "66.209.94.37"                          # Your HTTP server, Apache/etc
role :app, "66.209.94.37"                          # This may be the same as your `Web` server
role :db,  "66.209.94.37", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end

require "bundler/capistrano"

require File.split(File.expand_path(__FILE__)).first + "/passenger_deploy.rb"