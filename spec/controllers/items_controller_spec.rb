require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  # before(:each) do
  # end

  it "successfully renders items" do
    get :index
    expect(response.status).to eq 200
  end
end
