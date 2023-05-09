require_relative 'parser'
require_relative 'http'
require_relative 'printer'

CARDS_FILE_PATH = 'cards.txt'

def get_cards file
  @cards = File.open(file).map {|card| card.chomp }
end

def main
  card_list = get_cards(CARDS_FILE_PATH)

  Printer::welcome card_list

  card_list.each do |card_name|
    Printer::checking_card card_name

    response = Http::get_card_auctions(card_name)
    auctions = Parser.get_auctions response.body

    Printer::print_auctions card_name, auctions
  end
end

main
