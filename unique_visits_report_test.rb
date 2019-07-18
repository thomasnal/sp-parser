require './unique_visits'
require './unique_visits_report'
require './visits_log'
require 'minitest/autorun'


class UniqueVisitsReportTest < Minitest::Test

  def test_it_prints_uniques
    visits_log = VisitsLog.new 'test_fixture1.log'
    uniques = UniqueVisits.new visits_log

    report = UniqueVisitsReport.new uniques

    out, err = capture_io { report.print }
    assert_match /\/path1 1 unique views/, out
  end


  def test_it_prints_ordered_desc
    visits_log = VisitsLog.new 'test_fixture2.log'
    uniques = UniqueVisits.new visits_log

    report = UniqueVisitsReport.new uniques

    out, err = capture_io { report.print }
    assert_match /\/path2.+\/path1/m, out
  end

end
