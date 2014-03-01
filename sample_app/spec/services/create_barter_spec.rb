require 'spec_helper'

describe CreateBarter do
  let(:params) { attributes_for(:barter) }
  subject(:service_call) { described_class.call(params) }

  describe "#call" do
    it "creates a new barter object" do
      expect {
        service_call
      }.to change { Barter.count }.by(1)
    end

    it "sends an e-mail to the user who submitted the barter" do
      expect(UserMailer).to receive(:barter_posted).
        and_return(double('mailer').as_null_object)
      service_call
    end

    context "when the barter_params are invalid" do
      let(:params) { attributes_for(:barter).merge(email: nil) }

      it "doesn't send an e-mail if the barter isn't valid" do
        expect(UserMailer).not_to receive(:barter_posted)

        service_call
      end

    end
  end
end

