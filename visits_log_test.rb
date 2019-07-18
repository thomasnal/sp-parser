require "./visits_log.rb"
require 'minitest/autorun'


class VisitsLogTest < Minitest::Test

  def test_it_reads_file
    visits_log = VisitsLog.new 'test_fixture.log'

    log_items = visits_log.each_with_object([]) do |path, ip, obj|
      obj << "#{path} #{ip}"
    end

    assert_equal 2, log_items.count

    assert_match /help_page/, log_items[0]
    assert_match /126\.318\.035\.038/, log_items[0]
    assert_match /contact/, log_items[1]
    assert_match /184\.123\.665\.067/, log_items[1]
  end

end
