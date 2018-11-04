class Reading < ApplicationRecord
  # MIXINS
  include Redis::Objects

  # REDIS

  # CONSTANTS

  # ASSOCIATIONS
  belongs_to :thermo_stat

  # SCOPES

  # VALIDATIONS
  validates :temperature, presence: true, numericality: { only_float: true }
  validates :humidity, presence: true, numericality: { only_float: true }
  validates :battery_charge, presence: true, numericality: { only_float: true }

  # ACCESSORS

  # CALLBACKS

  # Redis
  

  # Assign an API key on create

  # SERIALIZED ATTRIBUTES

  ### METHODS
  # CLASS Methods
  class << self
    # def from_api_key(household_token)
    #   user = ThermoStat.find_by_household_token household_token
    # end
  end
  # INSTANCE Methods

  # # Generate a unique API key
  # def generate_household_token
  #   loop do
  #     token = SecureRandom.base64.tr('+/=', 'Qrt')
  #     break token unless ThermoStat.exists?(household_token: token)
  #   end
  # end
end
