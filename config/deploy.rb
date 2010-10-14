set :application, "pecha-kucha"
set :repository,  "."
set :stack, :passenger

set :scm, :git
set :deploy_via, :copy

set :user, "Administrator"
set :use_sudo, false

set :branch, "master"
set :deploy_to, "/Library/WebServer/#{application}"
set :shared_dir, "shared"

role :web, "pecha-kucha.nor.primedia.com"                          # Your HTTP server, Apache/etc
role :app, "pecha-kucha.nor.primedia.com"                          # This may be the same as your `Web` server
role :db,  "pecha-kucha.nor.primedia.com", :primary => true # This is where Rails migrations will run

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

namespace :deploy do
  task :full do
    transaction do
      deploy.update
      deploy.migrate
      deploy.restart
    end
  end

  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end

end

task :after_update_code do
  run "ln -nfs #{deploy_to}/#{shared_dir}/database.yml #{release_path}/config/database.yml"
  run "ln -nfs #{deploy_to}/#{shared_dir}/.htaccess #{release_path}/.htaccess"
end
