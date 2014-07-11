require 'spec_helper'
require 'commute_report'

describe Report do

  it "returns inbound commute time for a given week and day" do
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
          week: 1,
          day: "Wednesday",
          mode: "Drive",
          inbound: 14,
          outbound: 12,
          distance: 5
        }
      ]
    }
    report = Report.new(input)
    expect(report.inbound_commute_time("Emily", 5, "Tuesday")).to eq 12
  end

  it "returns mode of transportation for a given day and week" do
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
          week: 1,
          day: "Wednesday",
          mode: "Drive",
          inbound: 14,
          outbound: 12,
          distance: 5
        }
      ]
    }
    report = Report.new(input)
    expect(report.mode_of_trans("Gerard", 1, "Wednesday")).to eq "Drive"
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

    report = Report.new(input)
    expect(report.commute_comparison("Emily", "Gerard", 4)).to eq "Gerard"
  end

  it "computes average commute time for group" do

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
    report = Report.new(input)
    expected = (12 + 15 + 12 + 15 + 14 + 12) / 6
    expect(report.compute_average_commute_time).to eq expected
  end

end