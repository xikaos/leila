require 'spec_helper'
require 'httparty'
require_relative '../http.rb'

describe Http do
  let(:base_uri) { 'https://base-uri.com/base/uri' }
  let(:headers) { { 'user-agent' => 'Ruby 3.0 User Agent' } }
  let(:http_response) { instance_double(HTTParty::Response, body: response_body) }
  let(:response_body) { 'response_body' }

  before do
    allow(HTTParty).to receive(:get).and_return(http_response)

    @client = Http.new(base_uri, headers)
  end

  describe '#new' do
    it "Is created with the expected Base URI" do
      expect(@client.base_uri).to eq(base_uri)
    end

    it "Is created with the expected headers" do
      expect(@client.headers).to eq(headers)
    end
  end

  describe '#get' do
    it "Performs the HTTP request and return the expected response body" do
      expect(@client.get('/url').body).to eq(response_body)
    end
  end
end
