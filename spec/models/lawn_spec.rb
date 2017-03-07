require 'rails_helper'

RSpec.describe Lawn, type: :model do
  let(:lawn) { Lawn.create("My Lawn")}

  it "has a name" do
    expect(lawn.name).to eq("My Lawn")
  end
end
