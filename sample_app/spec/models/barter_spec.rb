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

  describe "notify the submitter" do
    it "notifies the submitter that their barter was posted to the site" do
      barter = build(:barter)
      expect(UserMailer).to receive(:barter_posted).
        with(barter).
        and_return(double('mailer').as_null_object)

      barter.save
    end
  end

  describe "notify the original submitter when a response is posted" do
    it "notifies the submitter that their barter was posted to the site" do
      original_barter = create(:barter)
      response_barter = build(:barter, barter_id: original_barter.id)

      expect(UserMailer).to receive(:barter_response).
        with(response_barter, original_barter).
        and_return(double('mailer').as_null_object)

      response_barter.save
    end
  end

end
