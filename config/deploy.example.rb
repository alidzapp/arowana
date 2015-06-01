lock '3.4.0'

set :application, 'arowana'
set :repo_url, 'https://github.com/soosc/arowana.git'
set :branch, 'master'
set :deploy_to, '/home/deploy/apps/arowana'

after "deploy", "foreman:export"
after "deploy", "foreman:restart"

set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')
set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml', '.env')

set :default_env, { path: '/home/deploy/.rbenv/shims:/home/deploy/.rbenv/bin:/home/deploy/.rbenv/shims:/home/deploy/.rbenv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games', rails_env: "production" }