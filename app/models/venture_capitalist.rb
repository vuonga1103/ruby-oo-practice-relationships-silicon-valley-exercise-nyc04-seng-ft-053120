class VentureCapitalist
  attr_reader :name, :total_worth

  @@all = []

  def initialize(name, total_worth)
    @name = name
    @total_worth = total_worth

    @@all << self
  end

  def self.all
    @@all
  end

  def self.tres_commas_club
    # returns an array of all venture capitalists in tres commas club, they have more than 1,000,000,000 total_worth

    self.all.select { |venture_capitalist| venture_capitalist.total_worth > 1000000000}
  end

  def offer_contract(startup, type, investment)
    # given a startup object, type of investment (as a string), and the amount invested (as a float), creates a new funding round and associates it with that startup and venture capitalist.

    FundingRound.new(startup, self, type, investment)
  end

  def funding_rounds
    # returns an array of all funding rounds for that venture capitalist

    FundingRound.all.select { |funding_round| funding_round.venture_capitalist == self }
  end
end
