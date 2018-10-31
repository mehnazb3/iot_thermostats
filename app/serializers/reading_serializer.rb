class ReadingSerializer < ActiveModel::Serializer
  attributes :id, :thermo_stat, :number, :temperature, :humidity, :battery_charge, :created_at, :updated_at
end
