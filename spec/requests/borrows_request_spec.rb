require 'rails_helper'

RSpec.describe "Borrows", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/borrows/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/borrows/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/borrows/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/borrows/destroy"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/borrows/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
