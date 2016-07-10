class Jury
  attr_reader :members

  def initialize
    @members = []
  end

  def add_member(contestant)
    @members << contestant
  end
end
