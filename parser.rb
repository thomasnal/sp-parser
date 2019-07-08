#!/usr/bin/env ruby

require './visits_log'
require './total_visits_report'
require './unique_visits_report'


module Parser

  def self.parse
    visits_log = VisitsLog.new ARGV[0]
    visits = visits_log.items

    counts_report = TotalVisitsReport.new visits
    counts_report.print

    uniques_report = UniqueVisitsReport.new visits
    uniques_report.print
  end

end


# load in irb/test without running it
if $0 == __FILE__      
  Parser.parse
end
