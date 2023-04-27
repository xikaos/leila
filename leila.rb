require 'httparty'
require 'nokogiri'
require 'pry'

BASE_URL="http://www.ligamagic.com.br/?view=cards%2Fsearch&card=current_card"
@current_card = nil

class Offer
  attr_accessor :name, :price, :bids, :owner, :references, :time

  def initialize offer
    @name = offer[0]
    @price = offer[1]
    @bids = offer[2]
    @owner = offer[3]
    @references = offer[4]
    @time = offer[5]
  end

  def print_offer
    puts "\n"
      if @name.length > @references.length
        separator = "Nome ~> #{@name}".gsub(/./, "-") << "--|" 
      else
        separator = "Referências ~> #{@references}".gsub(/./, "-") << "|"
      end
    puts separator
    puts "Oferta ~> #{@name}"
    puts separator
    puts "Preço ~> #{@price}"
    puts separator
    puts "Lances ~> #{@bids}"
    puts separator
    puts "Vendedor ~> #{@owner}"
    puts separator
    puts "Referências ~> #{@references}"
    puts separator
    puts "Expira em ~> #{@time}"
    puts separator
    puts "\n"  
  end

end


def parameterize_card cardname
  @current_card = cardname.gsub(' ', '+')
end

def get_url cardname
  BASE_URL.gsub('current_card', cardname)
end

def do_request url
  user_agent = 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36'
  response = HTTParty.get(url, headers: { 'user-agent': user_agent })
  Nokogiri::HTML(response.body) unless response.body.nil?
end

def get_cards file
  @cards = File.open(file).map {|card| card.chomp }
end

def get_requests
@requests = get_cards('cards.txt').map do |card|
  do_request(get_url(parameterize_card(card)))
end
end


def welcome
  puts ' -- || Leila - Ligamagic Auction Checker || -- '
  puts " -- ||       You current cardlist is:    || --"
  get_cards('cards.txt').each {|card| puts "        -->     #{card}     <--"}
  puts '----------------------------------------------------'
end

def has_auction? doc
  doc.css('#cotacao-leiloes > tbody').empty? ? false : true
end

def get_offers node
  offers = node.css('#cotacao-leiloes > tbody').css('tr').map do |n|
     n.text.split("\r\n").reject {|z| z.strip == "" } 
  end

  offers.map do |offer|
    offer.map {|item| item.strip}
  end

end


def main
  welcome
  @cards.each do |card|
    puts "Checking for a #{card} auction..."
    puts "\n"
    request = do_request(get_url(parameterize_card(card)))
      if has_auction? request
        offers = get_offers request
        offers.each do |offer|
          leilao = Offer.new(offer)
          leilao.print_offer
        end
      else
        puts "NOPS!"
      end
  end
end

main

#@requests.last