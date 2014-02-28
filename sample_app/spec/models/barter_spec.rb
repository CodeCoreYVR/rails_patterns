require 'spec_helper'

describe Barter do

  describe "response" do
    it "allows multiple barter response" do
      original = create(:barter)
      response = create(:barter, barter_id: original.id)
      response2 = create(:barter, barter_id: original.id)
      expect(original.responses).to match_array([response, response2])
    end
  end

end
