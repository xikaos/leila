require 'httparty'
require 'nokogiri'
require 'pry'

require_relative 'auction'
require_relative 'parser'

include Parser

BASE_URL="http://www.ligamagic.com.br/?view=cards%2Fsearch&card=current_card"
@current_card = nil

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
    auctions = Parser.get_auctions response

    if auctions.empty?
      puts "No auction for #{card_name} :("
      next
    end

    auctions.each do |auction_data|
      auction = Auction.new(auction_data)
      auction.print_offer
    end
  end
end

main

#@requests.last