require 'commute_parser'
require 'csv'

describe CommuteParser do

  it "converts data in a CSV to a hash" do

    input = CSV.read('./data/sample_data.csv')

    report = CommuteParser.new(input)

    expected = {
      "Emily" => [
        {
          week: 4,
          day: "Monday",
          mode: "Walk",
          inbound: 12,
          outbound: 15,
          distance: 0.65
        },
        {
          week: 5,
          day: "Tuesday",
          mode: "Walk",
          inbound: 12,
          outbound: 15,
          distance: 0.65
        }
      ],
      "Gerard" => [
        {
          week: 1,
          day: "Wednesday",
          mode: "Drive",
          inbound: 14,
          outbound: 12,
          distance: 5
        }
      ]
    }
    expect(report.convert).to eq expected
  end




end
