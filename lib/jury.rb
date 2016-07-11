require 'bundler/setup'
require 'colorizr'

class Jury
  attr_accessor :members

  def initialize
    @members = []
  end

  def add_member(contestant)
    @members << contestant
  end

  def cast_votes(finalists)
    @members.each_with_object(Hash.new(0)) do |member, votes|
      vote = finalists.sample
      votes[vote.to_s] += 1
      puts "  #{member.to_s.pink} has voted for #{vote.to_s.green}"
    end
  end

  def report_votes(votes)
    votes.each { |member, vote| puts "  #{member.yellow} has #{vote.to_s.red} votes." }
  end

  def announce_winner(votes)
    votes.max_by { |_key, value| value }.first
  end
end
