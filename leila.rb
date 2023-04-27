require 'httparty'
require 'nokogiri'
require 'pry'

require_relative 'parser'
include Parser

BASE_URL="http://www.ligamagic.com.br/?view=cards%2Fsearch&card=current_card"
@current_card = nil

class Auction
  attr_accessor :name, :initial_price, :bids, :buyout_price, :seller, :reference_count, :positive_references, :expires_in

  def initialize auction_data
    if auction_data.empty?
      binding.pry
    end

    @name = auction_data[0]
    @initial_price = auction_data[1]
    @bids = auction_data[2]
    @buyout_price = auction_data[3]
    @seller = auction_data[4]
    @reference_count = auction_data[5]
    @positive_references = auction_data[6]
    @expires_in = auction_data[7]
  end

  def print_offer
    separator = '------------------------------'

    puts separator
    puts "Initial Price ~> #{@initial_price}"

    puts separator
    puts "Buyout Price ~> #{@buyout_price}"

    puts separator
    puts "Bids ~> #{@bids}"

    puts separator
    puts "Seller ~> #{@seller}"

    puts separator
    puts "References ~> #{@reference_count}"

    puts separator
    puts "Positive References ~> #{@positive_references}"

    puts separator
    puts "Expires In ~> #{@expires_in}"

    puts separator + "\n\n"
  end

end


def parameterize_card cardname
  cardname.gsub(' ', '+')
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


def main
  welcome
  @cards.each do |card_name|
    puts "Checking for a #{card_name} auction..."
    puts "\n"

    response = do_request(get_url(parameterize_card(card_name)))
    auctions = Parser.get_offers response

    if auctions.empty?
      puts "No auction for #{card_name} :("
      next
    end

    auctions.each do |auction_data|
      leilao = Auction.new([card_name] + auction_data)
      leilao.print_offer
    end
  end
end

main

#@requests.last