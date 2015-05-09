require 'capistrano/setup'
require 'capistrano/deploy'
require 'capistrano/rails'
require 'capistrano/rbenv'
require 'capistrano/bundler'
require 'capistrano/rails/assets'
require 'capistrano/rails/migrations'

set :rbenv_type, :user
set :rbenv_ruby, '2.2.2'
set :rbenv_custom_path, '/home/deploy/.rbenv'
set :rbenv_path, '/home/deploy/.rbenv'
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w{rake gem bundle ruby rails}
set :rbenv_roles, :all
set :bundle_binstubs, -> { shared_path.join('bin') }

Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }