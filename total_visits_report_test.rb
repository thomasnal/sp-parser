require './total_visits_report'
require "minitest/autorun"


class TotalVisitsReportTest < Minitest::Test
  
  def test_it_prints_empty
    report = TotalVisitsReport.new []

    assert_output(/^$/) { report.print }
  end


  def test_it_prints_totals
    visits = [
      { path: '/1', ip: '1' },
      { path: '/1', ip: '1' },
    ]

    report = TotalVisitsReport.new visits

    out, err = capture_io { report.print }
    assert_match /\/1 2 visits/, out
  end


  def test_it_prints_sorted_paths
    visits = [
      { path: '/1', ip: '1' },
      { path: '/2', ip: '1' },
      { path: '/2', ip: '1' },
      { path: '/3', ip: '1' }
    ]

    report = TotalVisitsReport.new visits

    out, err = capture_io { report.print }
    assert_match /\/2.+\/1.+\/3/m, out

    assert_match /\/1 1 visits/, out
    assert_match /\/2 2 visits/, out
    assert_match /\/3 1 visits/, out
  end

end
