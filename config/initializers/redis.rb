require "redis"

config = YAML::load(File.open("#{Rails.root}/config/redis.yml"))[Rails.env]

redis = Redis.new(config)