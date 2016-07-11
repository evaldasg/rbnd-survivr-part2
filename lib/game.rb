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
    merged_members = @tribes.map(&:members).flatten
    merged_tribe = Tribe.new({ name: name, members: merged_members })
    clear_tribes && @tribes.push(merged_tribe).first
  end

  def individual_immunity_challenge
    @tribes[0].members[0]
  end
end
