require_relative 'auction'
require_relative 'parser'
require_relative 'http'

def get_cards file
  @cards = File.open(file).map {|card| card.chomp }
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

    response = Http::get_card_auctions(card_name)
    auctions = Parser.get_auctions response.body

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
