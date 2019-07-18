#!/usr/bin/env ruby

require './total_visits'
require './total_visits_report'
require './unique_visits'
require './unique_visits_report'
require './visits_log'


module Parser

  def self.parse
    visits_log = VisitsLog.new ARGV[0]

    totals = TotalVisits.new visits_log
    totals_report = TotalVisitsReport.new totals
    totals_report.print

    uniques = UniqueVisits.new visits_log
    uniques_report = UniqueVisitsReport.new uniques
    uniques_report.print
  end

end


# load in irb/test without running it
if $0 == __FILE__      
  Parser.parse
end
