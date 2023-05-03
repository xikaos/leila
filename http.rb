class Http
  attr_accessor :base_uri, :headers

  DEFAULT_HEADERS = {
    'user-agent' => 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36'
  }

  BASE_URL = "http://www.ligamagic.com.br/?view=cards%2Fsearch&card=current_card"

  private_constant :DEFAULT_HEADERS, :BASE_URL

  def initialize base_uri = BASE_URL, headers = {}
    @base_uri = base_uri
    @headers = DEFAULT_HEADERS.merge headers
  end

  def get url
    response = HTTParty.get(url, headers: @headers)
  end
end
