class ThermoStat < ApplicationRecord
  # MIXINS

  # REDIS

  # CONSTANTS

  # ASSOCIATIONS

  # SCOPES

  # VALIDATIONS
  validates :household_token, presence: true, length: { minimum: 5, maximum: 200}

  # ACCESSORS

  # CALLBACKS

  # Assign an API key on create
  before_create do |thermo_stat|
    thermo_stat.household_token = thermo_stat.generate_household_token
  end

  # SERIALIZED ATTRIBUTES

  ### METHODS
  # CLASS Methods
  class << self
    def from_api_key(household_token)
      user = ThermoStat.find_by_household_token household_token
    end
  end
  # INSTANCE Methods

  # Generate a unique API key
  def generate_household_token
    loop do
      token = SecureRandom.base64.tr('+/=', 'Qrt')
      break token unless ThermoStat.exists?(household_token: token)
    end
  end

end
