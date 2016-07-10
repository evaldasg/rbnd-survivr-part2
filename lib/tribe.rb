class Tribe
  attr_reader :name, :members

  def initialize(options)
    @name = options[:name]
    @members = options[:members]
    puts 'E'
  end

  def to_s
    @name
  end

  def tribal_council(options = {})
    @members.select { |member| member != options[:immune] }.delete_at(0)
  end
end
