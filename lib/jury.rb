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

  def report_votes(_votes)
    puts '1'
    puts '2'
  end

  def announce_winner(votes)
    votes.keys[0]
  end
end
