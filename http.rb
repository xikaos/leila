require 'httparty'
require 'uri'

module Http
  DEFAULT_HEADERS = {
    'user-agent' => 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36'
  }

  BASE_URL = "http://www.ligamagic.com.br/"

  QUERY_PARAMS = {
    view: 'cards/card'
  }

  private_constant :DEFAULT_HEADERS, :BASE_URL, :QUERY_PARAMS

  def self.get_card_auctions card_name
    query_params = QUERY_PARAMS.merge(card: card_name)
    HTTParty.get(BASE_URL, query: query_params, headers: DEFAULT_HEADERS)
  end
end
