class Auction
    attr_accessor :name, :initial_price, :bids, :buyout_price, :seller, :reference_count, :positive_references, :expires_in

    def initialize auction_data
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