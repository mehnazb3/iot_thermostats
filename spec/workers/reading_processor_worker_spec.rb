require "rails_helper"
RSpec.describe  ReadingProcessorWorker do
  describe "routing" do
    it "Enqueues a reading processor worker" do
      ReadingProcessorWorker.perform_async(1, 1)
      expect(ReadingProcessorWorker.jobs.size).to eq(1)
      expect(ReadingProcessorWorker).to be_retryable 3
    end
  end
end