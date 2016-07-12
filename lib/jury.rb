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
    votes = Hash[finalists.map { |finalist| [finalist.to_s, 0] }]
    @members.each do |member|
      vote = finalists.sample
      votes[vote.to_s] += 1
      puts "  #{member.to_s.pink} has voted for #{vote.to_s.green}"
    end
    votes
  end

  def report_votes(votes)
    votes.each { |member, vote| puts "  #{member.yellow} has #{vote.to_s.red} votes." }
  end

  def announce_winner(votes)
    votes.max_by { |_key, value| value }.first
  end
end
