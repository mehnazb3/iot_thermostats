class ThermoStat < ApplicationRecord
  # MIXINS
  include Redis::Objects

  # REDIS

  # CONSTANTS

  # ASSOCIATIONS
  has_many :readings

  # SCOPES

  # VALIDATIONS
  validates :household_token, presence: true, length: {
    minimum: IotThermostat::Constants::ThermoStat::MINIMUM, maximum: IotThermostat::Constants::ThermoStat::MAXIMUM}
  validates :location, presence: true, length: {
    minimum: IotThermostat::Constants::ThermoStat::MINIMUM, maximum: IotThermostat::Constants::ThermoStat::MAXIMUM}

  # ACCESSORS

  # CALLBACKS

  # Redis
  counter :reading_count
  hash_key :unsaved_readings
  hash_key :stats

  # Assign an API key on create
  before_create do |thermo_stat|
    thermo_stat.household_token = ThermoStat.generate_household_token
  end

  # SERIALIZED ATTRIBUTES

  ### METHODS
  # CLASS Methods
  class << self
    def from_api_key(household_token)
      user = ThermoStat.find_by_household_token household_token
    end

    # Auto generate Household token
    def generate_household_token
      loop do
        token = SecureRandom.base64.tr('+/=', 'Qrt')
        break token unless ThermoStat.exists?(household_token: token)
      end
    end
  end

  # INSTANCE Methods
  def is_valid_sequence?(number)
    self.readings.find_by_number(number).blank?
  end

end
