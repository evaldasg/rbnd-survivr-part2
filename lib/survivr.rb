require 'bundler/setup'
require 'colorizr'
require_relative 'game'
require_relative 'tribe'
require_relative 'contestant'
require_relative 'jury'

# After your tests pass, uncomment this code below
# =========================================================
# # Create an array of twenty hopefuls to compete on the island of Borneo
@contestants = %w(carlos walter aparna trinh diego juliana poornima juha sofia julia fernando dena orit
                  colt zhalisa farrin muhammed ari rasha gauri)
@contestants.map! { |contestant| Contestant.new(contestant) }.shuffle!

# # Create two new tribes with names
@coyopa = Tribe.new(name: 'Pagong', members: @contestants.shift(10))
@hunapu = Tribe.new(name: 'Tagi', members: @contestants.shift(10))

# # Create a new game of Survivor
@borneo = Game.new(@coyopa, @hunapu)
#=========================================================

# Helpers
def header(name)
  puts "\n-= Phase #{name} =-".pink
end

def footer
  puts '  Summary: ' + @borneo.tribes.map { |tribe| tribe.details.yellow }.join(' / ') + "\n\n"
end

# This is where you will write your code for the three phases
def phase_one
  voted_off_contestants = []
  header('One')
  8.times do |_i|
    losing_tribe = @borneo.immunity_challenge
    puts "  Immunity challenge has lost '#{losing_tribe}' tribe.".blue
    voted_off_contestants << loser_contestant = losing_tribe.tribal_council
    puts "  #{loser_contestant}".red + ' has been voted off.'
  end
  footer
  voted_off_contestants.size
end

def phase_two
  voted_off_contestants = []
  header('Two')
  3.times do |_i|
    immune = @borneo.individual_immunity_challenge
    puts '  Immunity has '.blue + immune.to_s.red
    voted_off_contestants << loser_contestant = @borneo.tribes.first.tribal_council(immune: immune)
    puts "  #{loser_contestant}".red + ' has been voted off.'
  end
  footer
  voted_off_contestants.size
end

def phase_three
  header('Three')
  7.times do |_i|
    immune = @borneo.individual_immunity_challenge
    puts '  Immunity has '.blue + immune.to_s.red
    @jury.add_member(jury_contestant = @borneo.tribes.first.tribal_council(immune: immune))
    puts "  #{jury_contestant}".red + ' has been voted off and became jury member.'
  end
  footer
  @jury.members.size
end

# If all the tests pass, the code below should run the entire simulation!!
#=========================================================
phase_one # 8 eliminations
@merge_tribe = @borneo.merge('Cello') # After 8 eliminations, merge the two tribes together
phase_two # 3 more eliminations
@jury = Jury.new
phase_three # 7 elminiations become jury members
finalists = @merge_tribe.members # set finalists
vote_results = @jury.cast_votes(finalists) # Jury members report votes
@jury.report_votes(vote_results) # Jury announces their votes
puts "WINNER IS #{@jury.announce_winner(vote_results)}!!!".red # Jury announces final winner
