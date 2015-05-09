namespace :foreman do
  desc "Export the Procfile to Ubuntu's upstart scripts"
  task :export do
    on roles(:all) do
      within "#{release_path}" do
        execute :rbenv, :sudo, "foreman export upstart /etc/init -a arowana -u deploy -l #{shared_path}/log -d /home/deploy/apps/arowana/current"
      end
    end
  end

  desc "Start the application services"
  task :start do
    execute :sudo, "service arowana start"
  end

  desc "Stop the application services"
  task :stop do
    execute :sudo, "service arowana stop"
  end

  desc "Restart the application services"
  task :restart do
    on roles(:all) do
      within "#{release_path}" do
        execute :sudo, "service arowana restart"
      end
    end
  end
end