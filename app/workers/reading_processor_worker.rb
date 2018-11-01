class ReadingProcessorWorker
  include Sidekiq::Worker
  sidekiq_options queue: "high"
  sidekiq_options retry: false

  def perform(thermostat_id, number)
    # p "I am inside worker"
  end
end