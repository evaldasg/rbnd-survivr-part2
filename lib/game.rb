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

  def clear_tribes
    @tribes = []
  end

  def merge(name)
    Tribe.new({ name: name, members: @tribes.map(&:members).flatten })
  end

  def individual_immunity_challenge
    @tribes[0].members[0]
  end
end
