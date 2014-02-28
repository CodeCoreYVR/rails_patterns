require 'spec_helper'

describe BartersController do

  describe "#create" do

    let(:create_params) {
      { barter: FactoryGirl.attributes_for(:barter) }
    }

    def perform_post(params = {})
      post(:create, create_params.merge(params))
    end

    it "creates a barter from the params" do
      expect {
        perform_post
      }.to change{ Barter.count }.by(1)
    end
  end

end
