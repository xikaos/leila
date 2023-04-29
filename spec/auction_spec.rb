require 'spec_helper'
require_relative '../auction'

describe Auction do
    describe '#new' do
        it "Is created with the values I expect" do
            @values = {
                name: 'Magic Card',
                initial_price: 'R$ 10,00',
                bids: 10,
                buyout_price: 'R$ 20,00',
                seller: 'Card Seller',
                reference_count: '42',
                positive_references: '100%',
                expires_in: '17h 32m'
            }

            auction = Auction.new(@values)

            expect(auction.to_h).to eq(@values)
        end
    end
end