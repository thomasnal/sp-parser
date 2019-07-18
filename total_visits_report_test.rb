require './total_visits'
require './total_visits_report'
require './visits_log'
require "minitest/autorun"


class TotalVisitsReportTest < Minitest::Test
  
  def test_it_prints_totals
    visits_log = VisitsLog.new 'test_fixture1.log'
    totals = TotalVisits.new visits_log

    report = TotalVisitsReport.new totals

    out, err = capture_io { report.print }
    assert_match /\/path1 2 visits/, out
  end


  def test_it_prints_ordered_desc
    visits_log = VisitsLog.new 'test_fixture2.log'
    totals = TotalVisits.new visits_log

    report = TotalVisitsReport.new totals

    out, err = capture_io { report.print }
    assert_match /\/path2.+\/path1/m, out
  end

end
