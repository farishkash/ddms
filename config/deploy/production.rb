set :stage, :production

# Replace 127.0.0.1 with your server's IP address!
server '45.58.60.40', user: 'deploy', roles: %w{web app db}