class ReadingProcessorWorker
  include Sidekiq::Worker
  sidekiq_options queue: "high"
  sidekiq_options retry: false

  def perform(thermostat_id, number)
    # p "I am inside worker"
    thermo_stat = ThermoStat.where(id: thermostat_id).first
    if thermo_stat.present?
      reading_params = eval(thermo_stat.unsaved_readings["#{number}"])
      reading = thermo_stat.readings.new(reading_params)
      reading.number = number
      if reading.save
        thermo_stat.unsaved_readings.delete("#{number}")
        # Calculate Stats
        calculate_stats()
      else
      end
    end
  end

  def calculate_stats(thermo_stat, number, reading_params )
    prev_stats = thermostat.stats
    unit_stat(reading_params[:temperature].to_f, prev_stats.all )
    unit_stat(reading_params[:humidity].to_f, prev_stats.all )
    unit_stat(reading_params[:battery_charge].to_f, prev_stats.all )
    # Merge above hashes
  end

  def unit_stat(type, value, previous_details, number)
    if previous_details.present?
      counter = number - 1
      type_avg = ( ( previous_details["#{type.to_s}"]['avg'].to_f * counter) + value ) / (number)
      type_min = (previous_details["#{type.to_s}"]['min'].to_f <= value) ? previous_details["#{type.to_s}"]['min'].to_f : value
      type_max = (previous_details["#{type.to_s}"]['max'].to_f >= value) ? previous_details["#{type.to_s}"]['max'].to_f : value
    else
      type_avg = type_min = type_max = value
    end
    { "#{type.to_s}" => { avg: type_avg, min: type_min, max: type_max} }
  end

end