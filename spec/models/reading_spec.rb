require 'rails_helper'

RSpec.describe Reading, :type => :model do

  before(:all) do
    @thermo_stat = FactoryBot.create(:thermo_stat)
  end

  describe "Associations" do
    describe "Belongs to thermostat" do
      it "creates a new Reading" do
        t = Reading.reflect_on_association(:thermo_stat)
        expect(t.macro).to eq(:belongs_to)
      end
    end
  end

  describe "Validations for Reading" do
    it "should require a temperature" do
      expect(FactoryBot.build(:reading, temperature: "")).not_to be_valid
      expect(FactoryBot.build(:reading, temperature: "23.50", thermo_stat_id: @thermo_stat.id)).to be_valid
      expect(FactoryBot.build(:reading, temperature: 23.50, thermo_stat_id: @thermo_stat.id)).to be_valid
    end

    it "should require a humidity" do
      expect(FactoryBot.build(:reading, humidity: "", thermo_stat_id: @thermo_stat.id)).not_to be_valid
      expect(FactoryBot.build(:reading, humidity: "120.50", thermo_stat_id: @thermo_stat.id)).to be_valid
      expect(FactoryBot.build(:reading, humidity: 120.50, thermo_stat_id: @thermo_stat.id)).to be_valid
    end

    it "should require a Battery charge" do
      expect(FactoryBot.build(:reading, battery_charge: "", thermo_stat_id: @thermo_stat.id)).not_to be_valid
      expect(FactoryBot.build(:reading, humidity: "20", thermo_stat_id: @thermo_stat.id)).to be_valid
      expect(FactoryBot.build(:reading, battery_charge: 90, thermo_stat_id: @thermo_stat.id)).to be_valid
    end
  end

end
