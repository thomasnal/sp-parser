require "./visits_log.rb"
require 'minitest/autorun'


class VisitsLogTest < Minitest::Test

  def test_it_reads_file
    visits_log = VisitsLog.new 'test_fixture.log'

    logs = visits_log.items

    assert_equal 2, logs.length
    logs.each { |log| assert_kind_of Hash, log }

    assert_equal '/help_page/1', logs.first[:path]
    assert_equal '126.318.035.038', logs.first[:ip]
  end

end
