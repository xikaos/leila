require 'spec_helper'
require 'httparty'
require_relative '../http.rb'

describe Http do
  let(:http_response) { instance_double(HTTParty::Response, body: response_body) }
  let(:response_body) { 'Random Card Auction Data' }

  before do
    allow(HTTParty).to receive(:get).and_return(http_response)
  end

  describe '#get_card_auctions' do
    it "Performs the HTTP request and return the expected response body" do
      expect(Http::get_card_auctions('Random Card').body).to eq(response_body)
    end
  end
end
