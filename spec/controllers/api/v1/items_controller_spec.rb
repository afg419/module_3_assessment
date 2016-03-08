require 'rails_helper'

RSpec.describe Api::V1::ItemsController, type: :controller do
  it "successfully renders items" do
    get :index

    expect(response.body).to eq "some items"
    expect(response.status).to eq 200
  end
end
