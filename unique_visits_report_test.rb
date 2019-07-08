require './unique_visits_report'
require 'minitest/autorun'


class UniqueVisitsReportTest < Minitest::Test

  def test_it_prints_empty
    report = UniqueVisitsReport.new []

    assert_output(/^$/) { report.print }
  end


  def test_it_prints_visits
    visits = [
      { path: '/1', ip: '1' },
      { path: '/1', ip: '2' }
    ]

    report = UniqueVisitsReport.new visits

    out, err = capture_io { report.print }
    assert_match /\/1 2 unique views/, out
  end


  def test_it_prints_unique_visits
    visits = [
      { path: '/2', ip: '1' },
      { path: '/2', ip: '1' },
    ]

    report = UniqueVisitsReport.new visits

    out, err = capture_io { report.print }
    assert_match /\/2 1 unique views/, out
  end


  def test_it_prints_multiple_paths
    visits = [
      { path: '/1', ip: '1' },
      { path: '/1', ip: '2' },
      { path: '/2', ip: '1' },
      { path: '/2', ip: '1' },
    ]

    report = UniqueVisitsReport.new visits

    out, err = capture_io { report.print }
    assert_match /\/1 2 unique views/, out
    assert_match /\/2 1 unique views/, out
  end

end
