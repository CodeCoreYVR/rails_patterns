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
    context "creating a new barter" do
      it "notifies the submitter that the barter was posted" do
        expect(UserMailer).to receive(:barter_posted).and_return(double('mailer').as_null_object)
        perform_post
      end
    end

    context "creating a response barter" do
      let!(:original_barter) { create(:barter) }
      let(:create_params) {
        { barter: attributes_for(:barter).merge(barter_id: original_barter.id) }
      }
      it "notifies the submitter that the barter was posted" do
        original_barter # ensure it's created before the expectation
        expect(UserMailer).to receive(:barter_posted).and_return(double('mailer').as_null_object)
        perform_post
      end

      it "notifies the original submitter that there is a response" do
        expect(UserMailer).to receive(:barter_response).and_return(double('mailer').as_null_object)
        perform_post

      end

    end

  end

end
