class Auction
  attr_accessor :name, :initial_price, :bids, :buyout_price, :seller, :reference_count, :positive_references, :expires_in

  def initialize auction_data
    @name = auction_data[:name]
    @initial_price = auction_data[:initial_price]
    @bids = auction_data[:bids]
    @buyout_price = auction_data[:buyout_price]
    @seller = auction_data[:seller]
    @reference_count = auction_data[:reference_count]
    @positive_references = auction_data[:positive_references]
    @expires_in = auction_data[:expires_in]
  end

  def to_h
    {
      name: @name,
      initial_price: @initial_price,
      bids: @bids,
      buyout_price: @buyout_price,
      seller: @seller,
      reference_count: @reference_count,
      positive_references: @positive_references,
      expires_in: @expires_in,
    }
  end

  def print_offer
    separator = '------------------------------'

    puts separator
    puts "Name ~> #{@name}"

    puts separator
    puts "Initial Price ~> #{@initial_price}"

    if !@buyout_price.empty?
      puts separator
      puts "Buyout Price ~> #{@buyout_price}"
    end

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
