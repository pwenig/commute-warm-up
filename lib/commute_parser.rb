class CommuteParser
def initialize(input)
  @input = input
end

  def convert
    result = {}
  @input.delete_at(0)
  @input.each do |row|
    person = row[0]
    previous_trips = result.fetch(person) { [] }
    if previous_trips.nil?
      previous_trips = []
    end

    new_data = {
      week: row[1].to_i,
      day: row[2],
      mode: row[3],
      inbound: row[4].to_i,
      outbound: row[5].to_i,
      distance: row[6].to_f
    }
    updated_trips = previous_trips << new_data

    result[person] = updated_trips.sort do |a, b|
      same_week = (a[:week] <=> b[:week]).zero?
      if same_week
        day_num(a[:day]) <=> day_num(b[:day])
      else
        a[:week] <=> b[:week]
      end
    end
  end
    p result
  end

  def day_num(day_string)
    DateTime.parse(day_string).wday
  end
end