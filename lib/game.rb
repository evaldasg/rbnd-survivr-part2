class Game
  attr_reader :tribes

  # Game starts with two tribes!
  def initialize(tribe1, tribe2)
    @tribes = [tribe1, tribe2]
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
    merged_members = @tribes.map(&:members).flatten
    merged_tribe = Tribe.new({ name: name, members: merged_members })
    clear_tribes && add_tribe(merged_tribe).first
  end

  def individual_immunity_challenge
    @tribes.first.members.sample
  end
end
