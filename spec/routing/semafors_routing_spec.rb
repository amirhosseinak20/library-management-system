require "rails_helper"

RSpec.describe SemaforsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/semafors").to route_to("semafors#index")
    end

    it "routes to #new" do
      expect(get: "/semafors/new").to route_to("semafors#new")
    end

    it "routes to #show" do
      expect(get: "/semafors/1").to route_to("semafors#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/semafors/1/edit").to route_to("semafors#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/semafors").to route_to("semafors#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/semafors/1").to route_to("semafors#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/semafors/1").to route_to("semafors#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/semafors/1").to route_to("semafors#destroy", id: "1")
    end
  end
end
