require 'bundler/setup'
require 'colorizr'

class Tribe
  attr_reader :name, :members

  def initialize(options)
    @name = options[:name]
    @members = options[:members]
    puts name.yellow + " has been created with members: [#{members.map(&:name).join(', ')}].".green
  end

  def to_s
    @name
  end

  def tribal_council(options = {})
    voted_off = pick_random_member
    voted_off = pick_random_member while voted_off == options[:immune]
    @members.delete(voted_off)
  end

  def pick_random_member
    @members.sample
  end

  def details
    "#{name} has #{members.size} members"
  end
end
