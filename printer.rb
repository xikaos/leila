require_relative 'auction'

module Printer
  def self.welcome card_list
    puts ' -- || Leila - Ligamagic Auction Checker || -- '
    puts " -- ||       You current cardlist is:    || --"
    card_list.each{|card| puts "        -->     #{card}     <--"}
    puts '----------------------------------------------------'
  end

  def self.checking_card card_name
    puts "Checking for a #{card_name} auction..."
    puts "\n"
  end

  def self.print_auctions card_name, auctions
    if auctions.empty?
      puts "No auction for #{card_name} :("
      puts "\n"
      return puts "\n"
    end

    auctions.each do |auction_data|
      auction = Auction.new(auction_data)
      auction.print_offer
    end
  end
end
