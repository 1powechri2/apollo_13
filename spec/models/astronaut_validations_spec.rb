require 'rails_helper'

describe Astronaut, type: :model do
  describe "validations" do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:age)}
    it {should validate_presence_of(:job)}
  end
end
