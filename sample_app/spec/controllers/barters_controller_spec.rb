require 'spec_helper'

describe BartersController do

  describe "#create" do
    let(:barter_params) { FactoryGirl.attributes_for(:barter) }
    def perform_post(params = {})
      post(:create, { barter: barter_params.merge(params) })
    end
    it "creates a barter from the params" do
      expect {
        perform_post
      }.to change{ Barter.count }.by(1)
    end

    it "doesn't create a barter if the email is missing" do
      expect {
        perform_post(email: nil)
      }.to change{ Barter.count }.by(0)
    end
    context "creating a new barter" do
      it "notifies the submitter that the barter was posted" do
        expect(UserMailer).to receive(:barter_posted).and_return(double('mailer').as_null_object)
        perform_post
      end

      it "doesn't notify the submitter if the barter fails to save" do
        expect(UserMailer).not_to receive(:barter_posted)
        perform_post(email: nil)
      end
    end

    context "creating a response barter" do
      let!(:original_barter) { create(:barter) }
      let(:barter_params) { attributes_for(:barter).merge(barter_id: original_barter.id) }

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
