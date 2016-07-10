class Game
  attr_reader :tribes

  def initialize(*tribes)
    @tribes = tribes
  end

  def add_tribe(tribe)
    @tribes << tribe
  end

  def immunity_challenge
    @tribes.sample
  end

  def clear_tribes
    @tribes.clear
  end

  def merge(name)
    Tribe.new({ name: name, members: @tribes.map(&:members).flatten })
  end

  def individual_immunity_challenge
    @tribes[0].members[0]
  end
end
