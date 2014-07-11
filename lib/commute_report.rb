class Report
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

  def mode_of_trans(name, week, day)
    person_data = @input[name]
    data_for_week = person_data.find do |commute_data|
      commute_data[:week] == week && commute_data[:day] == day
    end
    data_for_week[:mode]
  end

  def commute_comparison(name1, name2, week)
    person1_data = @input[name1]
    person2_data = @input[name2]
    person1_data_for_week = person1_data.find do |commute_data1|
      commute_data1[:week] == week
    end
    person2_data_for_week = person2_data.find do |commute_data2|
      commute_data2[:week] == week
    end
    if person1_data_for_week[:inbound] > person2_data_for_week[:inbound]
      name1
    else
      name2
    end
  end

  def compute_average_commute_time
    commute_data = @input.map { |name, data| data }.flatten
    total_commute_time = commute_data.inject(0) { |sum, data| sum + data[:inbound] + data[:outbound] }
    total_number_of_data_point = (commute_data.length * 2)
    total_commute_time / total_number_of_data_point
  end


end