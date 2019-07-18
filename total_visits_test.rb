require './total_visits'
require 'minitest/autorun'


class TotalVisitsTest < Minitest::Test

  def test_it_counts_duplicates
    visits_log = VisitsLog.new 'test_fixture1.log'

    totals = TotalVisits.new visits_log

    assert_equal 2, totals.items['/path1']
  end


  def test_it_counts_each_path
    visits_log = VisitsLog.new 'test_fixture2.log'

    totals = TotalVisits.new visits_log

    assert_equal 1, totals.items['/path1']
    assert_equal 2, totals.items['/path2']
  end

end
