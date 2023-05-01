module Parser
  AUCTIONS_SELECTOR = 'div[mp="3"]'

  NAME_SELECTOR = 'div.l-titulo > p > a'
  INITIAL_PRICE_SELECTOR = 'div.l-col3 > p[1]'
  BIDS_SELECTOR = 'div.l-col3 > p.l-preco-aux[2]'
  BUYOUT_PRICE_SELECTOR = 'div.l-col3 > p.l-separador'
  SELLER_SELECTOR = 'div.l-col4 > p[1] > a.medium'
  REFERENCE_COUNT_SELECTOR = 'div.l-col4 > p[3]'
  POSITIVE_REFERENCES_SELECTOR = 'div.l-col4 > p[4]'
  EXPIRES_IN_SELECTOR = 'div.l-clock-tempo'

  def get_auctions response_body
    parsed_response = Nokogiri::HTML(response_body)
    parsed_response.css(AUCTIONS_SELECTOR).map do |auction|
        extract_auction_attributes auction
    end
  end

  private

  def extract_auction_attributes auction
    selectors = {
      name: NAME_SELECTOR,
      initial_price: INITIAL_PRICE_SELECTOR,
      bids: BIDS_SELECTOR,
      buyout_price: BUYOUT_PRICE_SELECTOR,
      seller: SELLER_SELECTOR,
      reference_count: REFERENCE_COUNT_SELECTOR,
      positive_references: POSITIVE_REFERENCES_SELECTOR,
      expires_in: EXPIRES_IN_SELECTOR
    }

    get_text = -> selector { auction.css(selector).text }
    selectors.transform_values(&get_text)
  end
end
