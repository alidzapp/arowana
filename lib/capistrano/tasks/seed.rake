namespace :deploy do
  desc "seed db"
  task :seed do
    on roles(:all) do
      within "#{current_path}" do
        execute :bundle, "exec rake db:seed RAILS_ENV=#{fetch(:rails_env)}"
      end
    end
  end
end