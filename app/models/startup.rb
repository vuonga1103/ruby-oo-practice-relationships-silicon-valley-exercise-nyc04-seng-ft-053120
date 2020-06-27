class Startup
  attr_reader :founder, :name, :domain, :pivot

  @@all = []

  def initialize(name, founder, domain)
    @name = name
    @founder = founder
    @domain = domain

    @@all << self
  end

  def pivot(domain_str, name_str)
    # change the domain and name of the startup (only public method through which the domain should be changed)
    @domain = domain_str
    @name = name_str
  end

  def self.all
    @@all
  end

  def self.find_by_founder(founder)
    # returns the first startup whose founder's name matches founder
    self.all.find { |startup| startup.founder == founder }
  end

  def self.domain
    # returns an array of all different startup domains
    self.all.map { |startup| startup.domain }
  end

  def sign_contract(venture_capitalist, type, investment)
    # given a venture capitalist object, type of investment (as a string), and the amount invested (as a float), creates a new funding round and associates it with that startup and venture capitalist.
    FundingRound.new(self, venture_capitalist, type, investment)
  end

  def num_funding_rounds
    # Returns the total number of funding rounds that the startup has gotten
    self.funding_rounds.count
  end

  def total_funds
    # Returns the total sum of investments that the startup has gotten
    self.funding_rounds.reduce(0) { |sum, funding_round| sum + funding_round.investment }
  end

  def investors
    # Returns a unique array of all the venture capitalists that have invested in this company

    self.funding_rounds.map { |funding_round| funding_round.venture_capitalist }.uniq
  end

  def big_investors
    # Returns a unique array of all the venture capitalists that have invested in this company and are in the Trés Commas club

    self.investors.select { |venture_capitalist| VentureCapitalist.tres_commas_club.include?(venture_capitalist) }
  end

  protected
  # hiding this function because we don't necessary want the public to know our funding rounds
  def funding_rounds
    # helper func that returns all the funding round instances that the startup has gotten

    FundingRound.all.select { |funding_round| funding_round.startup == self }
  end
end