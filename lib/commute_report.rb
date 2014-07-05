class CommuteReport

  def initialize(input)
    @input = input
  end

  def inbound_commute_time(name, week, day)
    person_data = @input[name]

    data_for_day_and_week = person_data.find do |commute_data|
      commute_data[:week] == week && commute_data[:day] == day
    end

    data_for_day_and_week[:inbound]
  end

def average_commute_time

  all_data = @input.map { |name, data| data}.flatten

  total_commute_time = all_data.inject(0) {|sum, data| sum + data[:inbound] + data[:outbound]}

  total_data_points = (all_data.length * 2)

  total_commute_time / total_data_points
end

end