require "rails_helper"

RSpec.describe NotificationManagersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/notification_managers").to route_to("notification_managers#index")
    end

    it "routes to #new" do
      expect(:get => "/notification_managers/new").to route_to("notification_managers#new")
    end

    it "routes to #show" do
      expect(:get => "/notification_managers/1").to route_to("notification_managers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/notification_managers/1/edit").to route_to("notification_managers#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/notification_managers").to route_to("notification_managers#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/notification_managers/1").to route_to("notification_managers#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/notification_managers/1").to route_to("notification_managers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/notification_managers/1").to route_to("notification_managers#destroy", :id => "1")
    end

  end
end
