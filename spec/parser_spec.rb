require 'spec_helper'
require_relative '../parser'

describe Parser do
  let(:response_body) { File.read('spec/stubs/auctions.html') }
  let(:http_response) { instance_double(HTTParty::Response, body: response_body) }

  describe '#get_auctions' do
    it 'Extract auction information from the response HTML' do
      expected_auction_attributtes = {
        :name => "Mastery of the Unseen",
        :initial_price =>  "R$ 1,00",
        :bids => "0 lances",
        :buyout_price => "R$ 18,00",
        :seller => "Top Seller",
        :reference_count => "187 referências",
        :positive_references => "(100.00% positivas)",
        :expires_in => "15h 8m"
      }

      auctions = Parser::get_auctions http_response.body

      expect(auctions.first).to eq(expected_auction_attributtes)
    end
  end
end
