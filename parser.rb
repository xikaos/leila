require 'pry'

module Parser
    AUCTIONS_SELECTOR = 'div[mp="3"]'

    INITIAL_PRICE_SELECTOR = 'div.l-col3 > p[1]'
    BIDS_SELECTOR = 'div.l-col3 > p.l-preco-aux[2]'
    BUYOUT_PRICE_SELECTOR = 'div.l-col3 > p.l-separador'
    SELLER_SELECTOR = 'div.l-col4 > p[1] > a.medium'
    REFERENCE_COUNT_SELECTOR = 'div.l-col4 > p[3]'
    POSITIVE_REFERENCES_SELECTOR = 'div.l-col4 > p[4]'
    EXPIRES_IN_SELECTOR = 'div.l-clock-tempo'

    def get_offers response
        auctions = response.css(AUCTIONS_SELECTOR).map do |auction|
            initial_price = auction.css(INITIAL_PRICE_SELECTOR).text
            bids = auction.css(BIDS_SELECTOR).text
            buyout_price = auction.css(BUYOUT_PRICE_SELECTOR).text
            seller = auction.css(SELLER_SELECTOR).text
            reference_count = auction.css(REFERENCE_COUNT_SELECTOR).text
            positive_references = auction.css(POSITIVE_REFERENCES_SELECTOR).text
            expires_in = auction.css(EXPIRES_IN_SELECTOR).text


            res = [
                initial_price,
                bids,
                buyout_price,
                seller,
                reference_count,
                positive_references,
                expires_in
            ]

            #binding.pry

            res
        end
    end
end