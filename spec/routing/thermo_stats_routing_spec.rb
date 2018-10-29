require "rails_helper"

RSpec.describe ThermoStatsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/thermo_stats").to route_to("thermo_stats#index")
    end

    it "routes to #new" do
      expect(:get => "/thermo_stats/new").to route_to("thermo_stats#new")
    end

    it "routes to #show" do
      expect(:get => "/thermo_stats/1").to route_to("thermo_stats#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/thermo_stats/1/edit").to route_to("thermo_stats#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/thermo_stats").to route_to("thermo_stats#create")
    end

    it "routes to #update" do
      expect(:put => "/thermo_stats/1").to route_to("thermo_stats#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/thermo_stats/1").to route_to("thermo_stats#destroy", :id => "1")
    end

  end
end
