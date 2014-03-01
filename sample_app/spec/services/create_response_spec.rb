require 'spec_helper'

describe CreateResponse do
  let(:original_barter) { create(:barter) }
  let(:params) { attributes_for(:barter) }
  subject(:service_call) { described_class.call(original_barter, params) }

  describe "#call" do
    it "creates a new barter object" do
      original_barter
      expect {
        service_call
      }.to change { Barter.count }.by(1)
    end

    context "when the barter params are valid" do

      it "sends an e-mail to the user who submitted the barter" do
        expect(UserMailer).to receive(:barter_posted).
          and_return(double('mailer').as_null_object)
        service_call
      end

      it "sends an e-mail to the original submitter of the first barter" do
        expect(UserMailer).to receive(:barter_response).
          and_return(double('mailer').as_null_object)
        service_call
      end

    end

    context "when the response_params are invalid" do

      let(:params) { attributes_for(:barter).merge(email: nil) }

      it "doesn't send an e-mail if the barter isn't valid" do
        expect(UserMailer).not_to receive(:barter_posted)

        service_call
      end

      it "doesn't sends an e-mail to the original submitter of the first barter" do
        expect(UserMailer).not_to receive(:barter_response)

        service_call
      end

    end
  end
end

