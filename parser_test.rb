require './parser'
require 'minitest/autorun'


class ParserTest < Minitest::Test

  def test_it_accepts_argument
    ARGV[0] = 'test_fixture.log'

    out, err = capture_io { Parser.parse }

    assert_match /.+visits.+unique views/m, out
  end

end
