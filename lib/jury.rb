class Jury
  attr_accessor :members

  def initialize
    @members = []
  end

  def add_member(contestant)
    @members << contestant
  end

  def cast_votes(contestants)
    finalists = {}
    finalists[1] = contestants[0]
    finalists[2] = contestants[1]
    finalists
  end
end
