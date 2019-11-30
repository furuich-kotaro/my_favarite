set :stage, :production
set :rails_env, 'production'
set :unicorn_rack_env, "production"

# server-based syntax
server '3.115.94.180', user: 'ec2-user', roles: %w{web app db}