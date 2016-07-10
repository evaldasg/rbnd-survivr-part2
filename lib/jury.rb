class Jury
  attr_accessor :members

  def initialize
    @members = []
  end

  def add_member(contestant)
    @members << contestant
  end

  def cast_votes(contestants)
    votes = (0..2).to_a
    @members.each { |_member| puts votes.sample }
    finalists = {}
    finalists[contestants[0].name] = 4
    finalists[contestants[1].name] = 3
    finalists
  end
end
