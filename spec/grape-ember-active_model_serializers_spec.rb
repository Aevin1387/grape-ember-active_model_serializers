require "spec_helper"
require "support/models/event"
require "grape-ember-active_model_serializers"

describe Grape::Ember::ActiveModelSerializers do
  let(:app) { Class.new(Grape::API) }

  before do
    app.format :json
    app.formatter :json, Grape::Ember::Formatter::ActiveModelSerializers
  end

  it "should set the meta data if the X-Total header is set" do
    app.get("/home/events") do
      header "X-Total", "1"
      [Event.new]
    end
    get("/home/events")
    response_json = JSON.parse(last_response.body)
    expect(response_json["meta"]["total"]).to eq("1")
  end

  it "does not include the meta data if there is no X-Total header" do
    app.get("/home/events/1") do
      [Event.new]
    end
    get("/home/events/1")
    response_json = JSON.parse(last_response.body)
    expect(response_json).to_not have_key("meta")
  end
end
