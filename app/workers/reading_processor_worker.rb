class ReadingProcessorWorker
  include Sidekiq::Worker
  sidekiq_options queue: "high"
  sidekiq_options retry: false

  def perform(thermostat_id, number)
    thermo_stat = ThermoStat.where(id: thermostat_id).first
    if thermo_stat.present?
      reading_params = eval(thermo_stat.unsaved_readings["#{number}"].to_s)
      reading = thermo_stat.readings.new(reading_params)
      reading.number = number
      if reading.save
        thermo_stat.unsaved_readings.delete("#{number}")
      else
      end
    end
  end

end