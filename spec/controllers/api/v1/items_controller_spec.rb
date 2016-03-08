require 'rails_helper'

RSpec.describe Api::V1::ItemsController, type: :controller do
  it "returns all items by json" do
    3.times do |n|
      Item.create(name: "item#{n}", description: "description#{n}", image_url: "image#{n}")
    end

    get :index
    expect(response.body).to eq  "[[\"item0\",\"description0\",\"image0\"],[\"item1\",\"description1\",\"image1\"],[\"item2\",\"description2\",\"image2\"]]"
    expect(response.status).to eq 200
  end

  it "returns specific item by json" do
    n = 0
    Item.create(name: "item#{n}", description: "description#{n}", image_url: "image#{n}")

    get :show, id: 1
    expect(response.body).to eq  "[\"item0\",\"description0\",\"image0\"]"
    expect(response.status).to eq 200
  end

  it "deletes specific item" do
    n = 0
    Item.create(name: "item#{n}", description: "description#{n}", image_url: "image#{n}")
    expect(Item.count).to eq 1

    delete :destroy, id: 1
    expect(response.status).to eq 204
    expect(Item.count).to eq 0
  end

  it "doesn't delete if no item" do
    delete :destroy, id: 1
    expect(response.status).to eq 400
    expect(response.body).to eq "{\"reply\":\"Item did not exist in database\"}"
  end

  it "creates an item" do
    n = 0
    params = {item: {name: "item#{n}", description: "description#{n}", image_url: "image#{n}"}}
    expect(Item.count).to eq 0

    post :create, params
    expect(response.status).to eq 201
    expect(response.body).to eq "[\"item0\",\"description0\",\"image0\"]"
    expect(Item.count).to eq 1
  end

end
