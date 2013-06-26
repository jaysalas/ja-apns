require File.dirname(__FILE__) + '/../spec_helper'

describe APNS::Packager do

  describe "#package" do
    let(:notification) { double('Notification', device_token: 'device_token', alert: 'Hello iPhone', badge: 3, sound: 'awesome.caf', other: nil) }
    subject { described_class.new(notification) }

    it "should package the notification" do
      Base64.encode64(subject.package).should == "AAAg3vLO/YTnAEB7ImFwcyI6eyJhbGVydCI6IkhlbGxvIGlQaG9uZSIsImJh\nZGdlIjozLCJzb3VuZCI6ImF3ZXNvbWUuY2FmIn19\n"
    end
  end
  
end

