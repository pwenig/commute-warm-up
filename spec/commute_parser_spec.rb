require 'spec_helper'
require 'commute_parser'
require 'csv'

describe CommuteParser do

  it "convert commute data to an array of hashes for each person" do

    input = CSV.read('/Users/paulwenig/gSchoolWork/commute-warm-up/data/test_data.csv')
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

    commute = CommuteParser.new(input)
    expect(commute.convert).to eq expected
  end
end