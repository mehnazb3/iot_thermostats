require 'sidekiq/web'

Sidekiq.configure_server do |config|
  config.average_scheduled_poll_interval = 2
end

# config = YAML::load(File.open("#{Rails.root}/config/redis.yml"))[Rails.env]
# Sidekiq.redis = Redis.new(:host => config['master']['host'], :port => config['master']['port'])
# Sidekiq.redis.namespace = "resque:#{config['namespace']}"
redis_conf = YAML::load(File.open("#{Rails.root}/config/redis.yml"))[Rails.env]
# config.redis = Redis.new(host: redis_conf['host'], port: redis_conf['port'] )
Sidekiq.configure_server do |config|
  config.redis = { url: "redis://#{redis_conf['host']}:#{redis_conf['port']}/0" }
end