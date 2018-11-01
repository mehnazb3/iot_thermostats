require 'sidekiq/web'

# klasses = [ReadingProcessorWorker]
# klasses.each do |klass|
#   klass.instance_eval do
#     include Sidekiq::Worker
#     sidekiq_options queue: "high"
#     sidekiq_options retry: false
#   end
# end

# Sidekiq.configure_server do |config|
#   config.redis = YAML::load(File.open("#{Rails.root}/config/redis.yml"))[Rails.env]
# end