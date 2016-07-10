class Game
  attr_reader :tribes

  def initialize(tribe1, tribe2)
    @tribes = [].push(tribe1, tribe2)
  end

  def add_tribe(tribe)
    @tribes << tribe
    @tribes
  end

  def immunity_challenge
    @tribes.last
  end
end
