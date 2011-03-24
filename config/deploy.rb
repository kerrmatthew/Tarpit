
set :application, "Tarpit"
set :repository,  "file:///Library/Git/tarpit.git"
set :local_repository,  "matthewkerr@wud-web.com:/Library/Git/tarpit.git"

set :deploy_to, '/Library/WebServer/vhosts/tarpit/'
#set :use_sudo, false
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

task :set_config_for_pg_gem, :roles => [:app, :db] do
  #run "cd #{current_path} && env ARCHFLAGS='-arch x86_64' bundle install"
  run "cd #{release_path} && bundle config build.pg --with-pg-config=/usr/local/Cellar/postgresql/9.0.1/bin/pg_config --with-opt-include=/usr/local/Cellar/postgresql/9.0.1/include --with-opt-lib=/usr/local/Cellar/postgresql/9.0.1/lib && env ARCHFLAGS='-arch x86_64' gem install pg"

end

before "bundle:install", :set_config_for_pg_gem


namespace :paperclip do
  desc "Symlink the assets folder"
  task :symlink, :roles => [:app] do
    run "mkdir -p #{shared_path}/assets && ln -nfs #{shared_path}/assets #{release_path}/assets"
  end
end

namespace :htaccess do 
  desc ".htacess tasks"
  task :reset, :roles => [:app] do 
    run "rm -f #{release_path}/public/.htaccess"
    run "touch #{release_path}/public/.htaccess"
    run "echo 'XSendFile On' >> #{release_path}/public/.htaccess"
    run "echo 'XSendFileAllowAbove on' >> #{release_path}/public/.htaccess"
  end
end

after 'deploy:update_code', 'paperclip:symlink'
after 'deploy:update_code', 'htaccess:reset'
