require 'dragonfly'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  protect_from_dos_attacks true
  secret "3de36bd637cfb26f781074fa05355a8d3f59e691de9845153bf99fa2aa5c6eb1"

  url_format "/media/:job/:name"

  datastore :file,
    root_path: Rails.root.join('public/system/dragonfly', Rails.env),
    server_root: Rails.root.join('public')
end

# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware

# Add model functionality
if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend Dragonfly::Model
  ActiveRecord::Base.extend Dragonfly::Model::Validations
end
