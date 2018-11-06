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
  validates :number, uniqueness: { scope: :thermo_stat_id }

  # ACCESSORS

  # CALLBACKS

  # Redis

  # Assign an API key on create

  # SERIALIZED ATTRIBUTES

  ### METHODS
  # CLASS Methods
  class << self
    # WIP
  end

  # INSTANCE Methods

end
