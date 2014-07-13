require 'spec_helper'
require 'commute_report'

describe CommuteReport do
  it "can determine a persons inbound commute time for a day and week" do
    input = {
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
      ]
    }
report = CommuteReport.new(input)

    expect(report.inbound_commute_time("Emily", 4, "Monday")).to eq 12

  end

  it "can determine the average commute time for all data" do

   input =  {
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

    report = CommuteReport.new(input)

    expected = (12 + 15 + 12 + 15 + 14 + 12) / 6

    expect(report.average_commute_time).to eq expected
  end

  it "compares two people's data for a week and determines longest inbound commute" do
    input = {
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
          week: 4,
          day: "Wednesday",
          mode: "Drive",
          inbound: 14,
          outbound: 12,
          distance: 5
        }
      ]
    }

    report = CommuteReport.new(input)
    expect(report.commute_comparison("Emily", "Gerard", 4)).to eq "Gerard"
  end

end
