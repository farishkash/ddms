require 'rails_helper'

RSpec.describe District, type: :model do
  before(:all)do
    @district1 = District.new(district_name: "District1")
  end

  it "should have a matching name" do
    expect(@district1.district_name).to eq("District1")
  end
end
