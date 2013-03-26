require "spec_helper"

describe ContactMailer do
  describe "private_email" do
    let(:mail) { ContactMailer.private_email }

    it "renders the headers" do
      mail.subject.should eq("Private email")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
